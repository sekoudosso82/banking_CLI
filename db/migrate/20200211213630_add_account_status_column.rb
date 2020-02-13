class AddAccountStatusColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :status, :string
  end
end
