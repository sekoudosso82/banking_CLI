class AccountOwner < ActiveRecord::Base

    has_many :accounts

    has_many :senders, foreign_key: :sender_id, class_name: 'Transfert'
    has_many :receivers, through: :senders 

end