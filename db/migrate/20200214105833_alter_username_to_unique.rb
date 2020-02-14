class AlterUsernameToUnique < ActiveRecord::Migration[5.2]
  def change
    add_index :account_owners, :user_name, unique: true
  end
end
