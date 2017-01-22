class ChangeDrinkerToString < ActiveRecord::Migration[5.0]
  def change
    change_column :profiles, :drinker, :string
  end
end
