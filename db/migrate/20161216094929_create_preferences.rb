class CreatePreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :preferences do |t|
      t.boolean :metric, default: false
      t.references :customer, foreign_key: true

      t.timestamps
    end

    add_reference :customers, :preference
  end
end
