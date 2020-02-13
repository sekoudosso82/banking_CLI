class CreateTransfertTable < ActiveRecord::Migration[5.2]
  def change
    create_table :transferts do |t|
      t.integer  :sender_id
      t.integer  :receiver_id
      t.integer  :trans_amount
      t.datetime :date  
    end
  end
end
