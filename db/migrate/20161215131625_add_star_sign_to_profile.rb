class AddStarSignToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :star_sign, :string
  end
end
