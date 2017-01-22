class AddDrinkerToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :drinker, :boolean
  end
end
