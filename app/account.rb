class Account < ActiveRecord::Base
    belongs_to :account_owner
    has_many :transactions
    # has_many :account_owners, through: :transactions
    
end