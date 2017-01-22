class AddCustomerIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :customer, foreign_key: true
  end
end
