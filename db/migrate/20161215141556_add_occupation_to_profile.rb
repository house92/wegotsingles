class AddOccupationToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :occupation, :string
  end
end
