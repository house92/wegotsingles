class MessagesController < ApplicationController

  def index
    @messages = Message.where("
    customer_id = #{current_customer.id.to_i} AND ((sender_id = #{current_customer.id.to_i} AND recipient_id = #{params[:contact_id].to_i})
    OR (sender_id = #{params[:contact_id].to_i} AND recipient_id = #{current_customer.id.to_i}))
    ")
    @messages.each do |message|
      message.update(read: true)
    end
    respond_to do |format|
      format.html {}
      format.json do
        render json: { messages: @messages }
      end
    end
  end

  def create
    if current_customer.is_premium || current_customer.profile.gender == "Female"
      message1 = Message.create(
        customer_id: current_customer.id,
        sender_id: current_customer.id,
        recipient_id: params[:recipient_id],
        body: params[:message_body],
        read: true
      )
      message2 = Message.create(
        customer_id: params[:recipient_id],
        sender_id: current_customer.id,
        recipient_id: params[:recipient_id],
        body: params[:message_body]
      )
      UserMailer.message_notification(current_customer, params[:recipient_id], message1).deliver_now
      render json: message1
    else
      render json: { notification: "Only premium members may send messages to other members. Please upgrade your account." }
    end
  end

  def destroy
    @messages = Message.where("
    customer_id = #{current_customer.id.to_i} AND ((sender_id = #{current_customer.id.to_i} AND recipient_id = #{params[:contact_id].to_i})
    OR (sender_id = #{params[:contact_id].to_i} AND recipient_id = #{current_customer.id.to_i}))
    ")
    @messages.each do |message|
      message.destroy
    end
  end

end
