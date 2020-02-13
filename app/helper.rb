# class #Helper < ActiveRecord::Base
  # require_relative './config/environment'
  # require 'tty-prompt'
  # $prompt =TTY::Prompt.new

  def welcome_
      system("clear")
      puts "=*"*20
      puts "=*     Welcome to Puppy Bank!!!"
      puts "=*"*20
      puts "=*"*20
  end 

  def login_
    puts "=*     Please login to continue!"
    print "=*     user_name :  "
    name = gets.chomp
    print "=*     password  :  "
    pass = gets.chomp
    user = AccountOwner.find_by(user_name: name, password: pass)
  end 
  


  def menu_
    puts "=*"*20
    puts "=*"*20
    puts "=*     What would you like to do?"
    puts "=*     0. Make a transfert"
    puts "=*     1. Make a deposit"
    puts "=*     2. Withdraw some money"
    puts "=*     3. Check balance"
    puts "=*     4. To close your account"
    puts "=*     5. Exit"
    puts "=*"*20
    puts "=*"*20
    puts
  end 
    
  def receipt_ (account_)
    puts "=*"*20
    puts "=*"*20
    puts "=*     Puppy bank checking balance    "
    puts "=*     your current balance is $#{account_.balance}    " #
    puts "=*     #{Time.now}      "
    puts "=*     Good bye                       "
    puts "=*"*20
    puts "=*"*20
  end 

def transfert_(sender)
    puts "=*     please enter the the amount to transfert"
    trans_am = gets.chomp.to_i

    puts "=*     please enter the receiver id number"
    rec = gets.chomp.to_i
    rec_acc = Account.find(rec)
    if rec_acc.status != "open"
      puts "=*     Sorry, this account is closed"
      # get_start(owner)
    end 

    trans = Transfert.create(sender_id: sender.id, 
                          receiver_id: rec, 
                          trans_amount: trans_am,
                          date: Time.now)
    (sender.balance -= trans_am)
    sender.save
    (rec_acc.balance += trans_am)
    rec_acc.save
    # get_start(owner)
end 

def deposit_(owner)
  if owner.status != "open"
    puts "=*     Sorry, this account is closed"
    # get_start(owner)
  end 
  puts "=*     please enter the amount : "
  dep_amount = gets.chomp.to_i
  transac = Transaction.create(account_id:owner.id, 
                        title: "deposit", 
                        transaction_amount: dep_amount,
                        transaction_date: Time.now).execute
end 

def withdraw_(owner)
  puts "=*     Withdraw some money"
                  if owner.status != "open"
                      puts "=*     Sorry, this account is closed"
                      # get_start(owner)
                  end 
                  puts "=*     Please enter the amount to withdraw"
                  withdraw_amount = gets.chomp.to_i
                  if withdraw_amount <= owner.balance
                      transac = Transaction.create(account_id:owner.id, 
                                title: "withdraw", transaction_amount: withdraw_amount,
                                transaction_date: Time.now).execute
                      # get_start(owner)
                    else
                      puts "=*"*20
                      puts "=*     your balance is less then the withdraw amount"
                      puts "=*"*20
                      # get_start(owner)
                  end
end 


def get_start(owner)
  
  if owner 
    user_acc_info  = Account.find(owner.id) #

    menu_
   
    choice = gets.chomp.to_i
  
      case (choice)
          when 0
            transfert_(user_acc_info)
            get_start(owner)

          when 1
            deposit_(user_acc_info)
            get_start(owner)
          when 2
            withdraw_(user_acc_info)
            get_start(owner)
          when 3 
            receipt_(user_acc_info)
            get_start(owner)     
          when 4
            user_acc_info.update_column(:status, "closed")
            get_start(owner)
          when 5 
            return
      end
    else
      puts "=*"*20
      puts "=*     user_name or password incorrect"
  end

end 