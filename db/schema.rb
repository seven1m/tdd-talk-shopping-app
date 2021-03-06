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

ActiveRecord::Schema.define(version: 20170314033716) do

  create_table "carts", force: :cascade do |t|
    t.string   "random_id",  limit: 100
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "order_lines", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "kind",        null: false
    t.string   "description", null: false
    t.decimal  "amount",      null: false
    t.integer  "ordering",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["order_id"], name: "index_order_lines_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "cart_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 50
    t.string   "description", limit: 1000
    t.decimal  "cost"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "selections", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_selections_on_cart_id"
    t.index ["product_id"], name: "index_selections_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.boolean  "admin",            default: false, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
