class AddImperialToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :imperial, :float
  end
end
