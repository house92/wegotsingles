class CreateAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :avatars do |t|
      t.references :profile, foreign_key: true
      t.string :avatar
      t.string :caption
      
      t.timestamps
    end
  end
end
