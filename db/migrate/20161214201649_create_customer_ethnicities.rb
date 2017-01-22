class CreateCustomerEthnicities < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_ethnicities do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :ethnicity, index: true, foreign_key: true

      t.timestamps
    end
  end
end
