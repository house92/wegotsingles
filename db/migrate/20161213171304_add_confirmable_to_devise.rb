class AddConfirmableToDevise < ActiveRecord::Migration[5.0]
  def up
    add_column :customers, :confirmation_token, :string
    add_column :customers, :confirmed_at, :datetime
    add_column :customers, :confirmation_sent_at, :datetime
    add_index :customers, :confirmation_token, unique: true
    execute("UPDATE customers SET confirmed_at = NOW()")
  end

  def down
    remove_columns :customers, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
