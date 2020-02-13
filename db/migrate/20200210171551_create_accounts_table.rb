class CreateAccountsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.integer :account_owner_id
      t.integer  :balance
      
    end
  end
end


