class DropConversationsAndModifyMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :sender, index: true
    add_reference :messages, :recipient, index: true

    remove_reference :messages, :customer, index: true, foreign_key: true
    remove_reference :messages, :conversation, index: true, foreign_key: true

    drop_table :conversations
  end
end
