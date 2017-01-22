class CreateCustomerLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_languages do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :language, index: true, foreign_key: true

      t.timestamps
    end
  end
end
