# require_relative './config/environment'
# # require 'tty-prompt'
# # $prompt =TTY::Prompt.new

# def get_start(owner)
  
#   if owner 
#     user_acc_info  = Account.find(owner.id) #

#     menu_
   
#     choice = gets.chomp.to_i
  
#       case (choice)
#           when 0
#               puts "please enter the the amount to transfert"
#               trans_am = gets.chomp.to_i

#               puts "please enter the receiver id number"
#               rec = gets.chomp.to_i
#               rec_acc = Account.find(rec)
#               if rec_acc.status != "open"
#                 puts "Sorry, this account is closed"
#                 get_start(owner)
#               end 
              
#               trans = Transfert.create(sender_id: user_acc_info.id, 
#                                     receiver_id: rec, 
#                                     trans_amount: trans_am,
#                                     date: Time.now)
#               (user_acc_info.balance -= trans_am)
#               user_acc_info.save
#               (rec_acc.balance += trans_am)
#               rec_acc.save
#               get_start(owner)

#           when 1
#                     if user_acc_info.status != "open"
#                       puts "Sorry, this account is closed"
#                       get_start(owner)
#                     end 
#                     puts "please enter the amount : "
#                     dep_amount = gets.chomp.to_i
#                     transac = Transaction.create(account_id:user_acc_info.id, 
#                                           title: "deposit", 
#                                           transaction_amount: dep_amount,
#                                           transaction_date: Time.now).execute
#                     get_start(owner)
#           when 2
#                   puts "Withdraw some money"
#                   if user_acc_info.status != "open"
#                       puts "Sorry, this account is closed"
#                       get_start(owner)
#                   end 
#                   puts "Please enter the amount to withdraw"
#                   withdraw_amount = gets.chomp.to_i
#                   if withdraw_amount < user_acc_info.balance
#                       transac = Transaction.create(account_id:user_acc_info.id, 
#                                 title: "withdraw", transaction_amount: withdraw_amount,
#                                 transaction_date: Time.now).execute
#                       get_start(owner)
#                     else
#                       puts "=*"*20
#                       puts "your balance is less then the withdraw amount"
#                       puts "=*"*20
#                       get_start(owner)
#                   end
#           when 3 
#                   receipt_(user_acc_info)
#                   get_start(owner)     
#           when 4
#                   user_acc_info.update_column(:status, "closed")
#                   get_start(owner)
#           when 5 
#                   return
#       end
#     else
#       puts "=*"*20
#       puts "user_name or password incorrect"
#   end

# end 
# welcome_ 
# x = login_
# get_start(x)
# # binding.pry
