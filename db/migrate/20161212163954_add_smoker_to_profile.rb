class AddSmokerToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :smoker, :boolean
  end
end
