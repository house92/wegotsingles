class CreateCustomerProfiles < ActiveRecord::Migration[5.0]
  def up
    execute "CREATE VIEW customer_profiles AS
               SELECT c.id, p.id AS profile_id, p.smoker, p.drinker, p.level_of_education, p.imperial, p.metric,
                 p.gender, c.last_sign_in_at, c.date_of_birth
                 FROM customers AS c
                   LEFT OUTER JOIN profiles AS p ON c.id = p.customer_id;"
  end
  def down
    execute "DROP VIEW IF EXISTS customer_profiles;"
  end
end