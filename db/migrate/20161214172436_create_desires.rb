class CreateDesires < ActiveRecord::Migration[5.0]
  def change
    create_table :desires do |t|
      t.string :name

      t.timestamps
    end
  end
end
