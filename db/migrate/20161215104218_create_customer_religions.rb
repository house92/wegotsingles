class CreateCustomerReligions < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_religions do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :religion, index: true, foreign_key: true

      t.timestamps
    end
  end
end
