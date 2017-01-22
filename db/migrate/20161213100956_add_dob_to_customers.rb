class AddDobToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :date_of_birth, :date
  end
end
