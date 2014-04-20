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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140420124448) do

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "payed"
    t.boolean  "done"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
  end

  create_table "orders", force: true do |t|
    t.integer  "count"
    t.decimal  "sum"
    t.decimal  "discount_sum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cart_id"
    t.integer  "weight",       default: 0
    t.text     "note"
    t.string   "image_url"
  end

  create_table "orders_products", id: false, force: true do |t|
    t.integer "order_id"
    t.integer "product_id"
  end

  add_index "orders_products", ["order_id", "product_id"], name: "index_orders_products_on_order_id_and_product_id"

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.decimal  "price",         precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "today_special",                         default: 0
    t.integer  "by_weight",                             default: 0
    t.integer  "category_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "string"
    t.boolean  "admin"
    t.decimal  "discount_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
