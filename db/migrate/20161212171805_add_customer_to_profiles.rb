class AddCustomerToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_reference :profiles, :customer, foreign_key: true
  end
end
