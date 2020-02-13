class Transaction < ActiveRecord::Base
    
    # belongs_to :account_owner
    belongs_to :account 

    def execute
        if title == "deposit"
            self.account.balance += transaction_amount
            self.account.save
        else
            self.account.balance -= transaction_amount
            self.account.save
        end 
    end 
    
end

