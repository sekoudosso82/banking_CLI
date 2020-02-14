# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_14_105833) do

  create_table "account_owners", force: :cascade do |t|
    t.string "user_name"
    t.string "password"
    t.integer "phone"
    t.index ["user_name"], name: "index_account_owners_on_user_name", unique: true
  end

  create_table "accounts", force: :cascade do |t|
    t.integer "account_owner_id"
    t.integer "balance"
    t.string "status"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "account_id"
    t.string "title"
    t.integer "transaction_amount"
    t.datetime "transaction_date"
  end

  create_table "transferts", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.integer "trans_amount"
    t.datetime "date"
  end

end
