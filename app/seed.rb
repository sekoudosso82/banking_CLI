# [#<AccountOwner:0x00007f994c1b8a68 id: 1, user_name: "Sekou", password: "098", phone: 6469252132>,
#  #<AccountOwner:0x00007f994c1c2b58 id: 2, user_name: "Peter", password: "099", phone: 6469252133>,
#  #<AccountOwner:0x00007f994c1c2a18 id: 3, user_name: "Osgood", password: "Osgood", phone: 987>]
# #  [2] pry(main)> AccountOwner.create(user_name: "David", password: "000", phone: 999)
#  => #<AccountOwner:0x00007f9946a2b480 id: 4, user_name: "David", password: "000", phone: 999>

# 4] pry(main)> Account.create(account_owner_id: 1, balance: 500, status: "open")
# => #<Account:0x00007fc73a6f2058 id: 4, account_owner_id: 1, balance: 500, status: "open">
# [5] pry(main)> Account.all
# => [#<Account:0x00007fc73a7b2718 id: 1, account_owner_id: 1, balance: 1400, status: "open">,
#  #<Account:0x00007fc73a7b2560 id: 2, account_owner_id: 2, balance: 10200, status: "open">,
#  #<Account:0x00007fc73a7b23d0 id: 3, account_owner_id: 3, balance: 20, status: "closed">,
#  #<Account:0x00007fc73a7b21f0 id: 4, account_owner_id: 1, balance: 500, status: "open">]