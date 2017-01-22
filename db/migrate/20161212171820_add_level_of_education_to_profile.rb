class AddLevelOfEducationToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :level_of_education, :string
  end
end
