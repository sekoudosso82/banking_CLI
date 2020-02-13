class Transfert < ActiveRecord::Base
    
    belongs_to :sender,   class_name: 'AccountOwner'
    belongs_to :receiver, class_name: 'AccountOwner'
  
end
