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
    puts "=*     Login or Register"
    puts "=*     1. Login to continue!"
    puts "=*     2. Create an account"
    choice = gets.chomp.to_i
  
      case (choice)
          when 1
              print "=*     user_name :  "
              name = gets.chomp
              print "=*     password  :  "
              pass = gets.chomp
              user = AccountOwner.find_by(user_name: name, password: pass)
          when 2 
            register_
      end  
  end 
  


  def menu_
    puts "=*"*20
    puts "=*"*20
    puts "=*     What would you like to do?"
    puts "=*     1. Make a transfert"
    puts "=*     2. Make a deposit"
    puts "=*     3. Withdraw some money"
    puts "=*     4. Check balance"
    puts "=*     5. To close your account"
    puts "=*     6. Exit"
    puts "=*"*20
    puts "=*"*20
    puts
  end 
    
  def receipt_ (account_)
    puts "=*"*20
    puts "=*"*20
    puts "=*     Puppy bank checking balance    "
    puts "=*     Your current balance is $#{account_.balance}    " 
    puts "=*     #{Time.now}      "
    puts "=*     Good bye                       "
    puts "=*"*20
    puts "=*"*20
  end 

def transfert_(sender)
    puts "=*     Transfert some money"
    if sender.status != "open"
            puts "=*     Sorry, this account is closed"
    else             
            puts "=*     Please enter the the amount to transfert"
            trans_am = gets.chomp.to_i
            if trans_am <= 0 
              puts "=*     You can't transfer less than Zero "
            elsif trans_am> sender.balance
              puts "=*     Transfert should be less than your balance"
            else
              puts "=*     Please enter the receiver id number"
              rec = gets.chomp.to_i
              rec_acc = Account.find(rec)
              if rec_acc.status != "open"
                puts "=*     Sorry, this account is closed"
              else
                trans = Transfert.create(sender_id: sender.id, 
                                      receiver_id: rec, 
                                      trans_amount: trans_am,
                                      date: Time.now)
                (sender.balance -= trans_am)
                sender.save
                (rec_acc.balance += trans_am)
                rec_acc.save
              end
            end      
    end
end 

def deposit_(owner)
  puts "=*     Deposit some money"
  if owner.status != "open"
      puts "=*     Sorry, this account is closed"
  else 
      puts "=*     Please enter the amount : "
      dep_amount = gets.chomp.to_i
      if dep_amount < 0
        puts "=*     Deposit amount can not be less than ZERO"
      else
      transac = Transaction.create(account_id:owner.id, 
                            title: "deposit", 
                            transaction_amount: dep_amount,
                            transaction_date: Time.now).execute
      end
  end
end 

def withdraw_(owner)
  puts "=*     Withdraw some money"
  if owner.status != "open"
      puts "=*     Sorry, this account is closed"    
  else                
      puts "=*     Please enter the amount to withdraw"
      withdraw_amount = gets.chomp.to_i
      if withdraw_amount < 0
        puts "=*     Withdraw amount can not be less than ZERO"
      
      elsif (withdraw_amount <= owner.balance)
         transac = Transaction.create(account_id:owner.id, 
                   title: "withdraw", transaction_amount: withdraw_amount,
                   transaction_date: Time.now).execute
      else
         puts "=*"*20
         puts "=*     Your balance is less then the withdraw amount"
         puts "=*"*20
      end
  end
end 


def get_start(owner)
  
  if owner 
    user_acc_info  = Account.find(owner.id) #

    menu_
   
    choice = gets.chomp.to_i 
      case (choice)
          when 1
            transfert_(user_acc_info)
            get_start(owner)

          when 2
            deposit_(user_acc_info)
            get_start(owner)
          when 3
            withdraw_(user_acc_info)
            get_start(owner)
          when 4
            receipt_(user_acc_info)
            get_start(owner)     
          when 5
            puts "=*     WARNING you will close this account."
            puts "=*     1. To close this account"
            puts "=*     2. To exit"
            choice = gets.chomp.to_i
          
              case (choice)
                  when 1
                    # user_acc_info.update_column(:status, "closed")
                    user_acc_info.destroy
                    owner.destroy
                    return 
                  when 2 
                    get_start(owner)
              end  
          when 6 
            return
          else 
            get_start(owner)
      end
    else
      puts "=*"*20
      puts "=*     user_name or password incorrect"
  end

end 

def register_
  print "=*     Please enter your user_name      :  "
  new_user_name = gets.chomp
  print "=*     Please enter your password       :  "
  new_user_password = gets.chomp
  print "=*     Please enter your phone num      :  "
  new_user_phone = gets.chomp.to_i
  print "=*     Please enter your initial amount :  "
  new_user_balance = gets.chomp.to_i
  nu = AccountOwner.create(user_name: new_user_name, 
                      password: new_user_password, 
                      phone: new_user_phone)

  Account.create(account_owner_id: nu.id, 
                 balance: new_user_balance, 
                 status: "open")
end 

def open_account_(owner)
  
  print "=*     Please enter your initial amount :  "
  new_user_balance = gets.chomp.to_i
  
  Account.create(account_owner_id: owner.id, 
                 balance: new_user_balance, 
                 status: "open")
end 