class AddGenderToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :gender, :string
  end
end
