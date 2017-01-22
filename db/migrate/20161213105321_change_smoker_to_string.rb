class ChangeSmokerToString < ActiveRecord::Migration[5.0]
  def change
    change_column :profiles, :smoker, :string
  end
end
