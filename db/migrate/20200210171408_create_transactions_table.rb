class CreateTransactionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :account_id 
      t.string :title 
      t.integer :transaction_amount
      t.datetime :transaction_date
      
    end
  end
end
