class AddDefaultAvatarToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_reference :profiles, :default_avatar
    remove_column :profiles, :image, :string
    remove_column :profiles, :avatar, :string
  end
end
