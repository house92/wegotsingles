class AddMetricToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :metric, :float
  end
end
