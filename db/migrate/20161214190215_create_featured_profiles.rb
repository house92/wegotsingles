class CreateFeaturedProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :featured_profiles do |t|
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
