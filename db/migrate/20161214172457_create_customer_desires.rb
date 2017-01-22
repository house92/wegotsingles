class CreateCustomerDesires < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_desires do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :desire, index: true, foreign_key: true

      t.timestamps
    end
  end
end
