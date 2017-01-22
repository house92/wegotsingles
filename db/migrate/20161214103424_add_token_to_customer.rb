class AddTokenToCustomer < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :login_token, :string
  end
end
