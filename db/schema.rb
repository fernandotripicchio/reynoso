# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131009193756) do

  create_table "accounts", :force => true do |t|
    t.integer  "client_id"
    t.text     "comments"
    t.decimal  "mount",      :precision => 8, :scale => 2
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "branches", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "phone"
    t.string   "comments"
    t.string   "city"
  end

  create_table "clients", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "phone"
    t.string   "address"
    t.string   "email"
    t.string   "province"
    t.string   "zip_code"
    t.text     "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "branch_id"
  end

  create_table "items", :force => true do |t|
    t.integer  "size"
    t.integer  "sale_id"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.decimal  "cost",        :precision => 8, :scale => 2
    t.decimal  "iva",         :precision => 8, :scale => 2
    t.decimal  "profit",      :precision => 8, :scale => 2
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "code"
    t.text     "description"
  end

  create_table "sale_items", :force => true do |t|
    t.integer  "sale_id"
    t.integer  "product_id"
    t.integer  "branch_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "size"
  end

  create_table "sales", :force => true do |t|
    t.date     "date_sale"
    t.integer  "branch_id"
    t.integer  "client_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "comments"
    t.string   "payment"
  end

  create_table "stock_logs", :force => true do |t|
    t.integer  "stock_id"
    t.integer  "supplier_id"
    t.string   "type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "stocks", :force => true do |t|
    t.integer  "size"
    t.integer  "branch_id"
    t.integer  "product_id"
    t.decimal  "disccount",     :precision => 8, :scale => 2
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
    t.integer  "suplier_id"
    t.string   "kind_movement",                               :default => "Incremento"
    t.integer  "profit"
    t.integer  "initial_stock"
    t.integer  "temporal_size"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.string   "observation"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "full_name",           :default => "", :null => false
    t.string   "login",                               :null => false
    t.string   "crypted_password",                    :null => false
    t.string   "password_salt",                       :null => false
    t.string   "email",                               :null => false
    t.string   "persistence_token",                   :null => false
    t.string   "single_access_token",                 :null => false
    t.string   "perishable_token",                    :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
