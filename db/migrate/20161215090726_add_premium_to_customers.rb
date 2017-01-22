class AddPremiumToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :is_premium, :boolean, default: false
  end
end
