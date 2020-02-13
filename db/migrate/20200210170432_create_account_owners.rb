class CreateAccountOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :account_owners do |t|
      t.string  :user_name
      t.string  :password
      t.integer :phone 
    end
  end
end
