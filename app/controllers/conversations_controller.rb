require 'will_paginate/array'

class ConversationsController < ApplicationController

  def index
    messages = Message.find_by_sql("
    SELECT m.*, c.username AS contact, c.id AS contact_id FROM messages AS m
      INNER JOIN customers AS c ON c.id = m.recipient_id WHERE sender_id = #{current_customer.id.to_i} AND customer_id = #{current_customer.id.to_i}
    UNION ALL
    SELECT m.*, c.username AS contact, c.id AS contact_id FROM messages AS m
      INNER JOIN customers AS c ON c.id = m.sender_id WHERE recipient_id = #{current_customer.id.to_i} AND customer_id = #{current_customer.id.to_i}
    ORDER BY contact_id, created_at;
    ")
    last_contact_id = nil
    last_contact_username = nil
    @conversations = []
    conversation_messages = []
    messages.each do |message|
      if last_contact_id != message.contact_id
        @conversations << { contact: { id: last_contact_id, username: last_contact_username }, messages: conversation_messages } unless last_contact_id == nil
        conversation_messages = []
        last_contact_id = message.contact_id
        last_contact_username = message.contact
      end
      conversation_messages << message
    end
    if last_contact_id != nil
      @conversations << { contact: { id: last_contact_id, username: last_contact_username }, messages: conversation_messages }
    end
    num_of_entries = 2
    @conversations = @conversations.paginate(page: params[:page], per_page: num_of_entries)
    respond_to do |format|
      format.html {}
      format.json do
        render json: {
          conversations: @conversations,
          customer: current_customer,
          page: params[:page],
          num_of_entries: num_of_entries
        }
      end
    end
  end

end
