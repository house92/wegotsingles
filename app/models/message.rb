class Message < ApplicationRecord

  belongs_to :customer
  belongs_to :receiver, class_name: "Customer"
  belongs_to :sender, class_name: "Customer"

  def self.conversation_messages(customer1, customer2)
    Message.where("
      (sender_id = #{customer1.id.to_i} AND recipient_id = #{customer2.id.to_i})
      OR (sender_id = #{customer2.id.to_i} AND recipient_id = #{customer1.id.to_i})
    ")
  end

end
