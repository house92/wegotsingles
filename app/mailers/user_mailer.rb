class UserMailer < ApplicationMailer

  def message_notification(user, recipient_id, message)
    @sender = user
    @recipient = Customer.find_by(id: recipient_id)
    @recipient.new_token!
    @url = "localhost:3000/customers/#{@recipient.id}/messages?contact_id=#{@sender.id}&amp;login_token=#{Customer.find_by(id: @recipient.id).login_token}"
    mail(to: @recipient.email, subject: "You have a new message from #{@sender.username}")
  end

end
