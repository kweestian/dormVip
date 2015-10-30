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

ActiveRecord::Schema.define(version: 20151030185211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bundles", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "poster_image_url"
    t.integer  "total_price"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "number_of_products"
    t.string   "type"
  end

  create_table "checkouts", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "user_id"
    t.boolean  "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "checkouts", ["order_id"], name: "index_checkouts_on_order_id", using: :btree
  add_index "checkouts", ["user_id"], name: "index_checkouts_on_user_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "name"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",         precision: 12, scale: 3
    t.decimal  "tax",              precision: 12, scale: 3
    t.decimal  "shipping",         precision: 12, scale: 3
    t.decimal  "total",            precision: 12, scale: 3
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.string   "user_id"
    t.string   "frequency"
    t.string   "type"
    t.integer  "order_item_id"
    t.string   "first_item"
    t.string   "second_item"
    t.string   "third_item"
    t.string   "phone_number"
    t.string   "delivery_address"
    t.datetime "delivery_time"
    t.boolean  "paid_status",                               default: false
  end

  add_index "orders", ["order_item_id"], name: "index_orders_on_order_item_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",       precision: 12, scale: 3
    t.boolean  "active"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "order_id"
    t.boolean  "admin"
  end

  add_index "users", ["order_id"], name: "index_users_on_order_id", using: :btree

  add_foreign_key "checkouts", "orders"
  add_foreign_key "checkouts", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "order_items"
end
