# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_12_15_044226) do
  create_table "cashbacks", force: :cascade do |t|
    t.integer "order_id"
    t.integer "user_id"
    t.float "amount"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_cashbacks_on_order_id"
    t.index ["user_id"], name: "index_cashbacks_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "restaurant_id"
    t.integer "restaurant_order_size_id"
    t.float "amount"
    t.float "amount_paid", default: 0.0
    t.string "status"
    t.text "items"
    t.string "restaurant_txn_id"
    t.float "cashback_offered", default: 0.0
    t.datetime "delivery_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_orders_on_restaurant_id"
    t.index ["restaurant_order_size_id"], name: "index_orders_on_restaurant_order_size_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "restaurant_cashback_percents", force: :cascade do |t|
    t.integer "restaurant_level_id"
    t.integer "restaurant_order_size_id"
    t.float "cb_percent", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_level_id"], name: "index_restaurant_cashback_percents_on_restaurant_level_id"
    t.index ["restaurant_order_size_id"], name: "index_restaurant_cashback_percents_on_restaurant_order_size_id"
  end

  create_table "restaurant_levels", force: :cascade do |t|
    t.string "name"
    t.integer "restaurant_id"
    t.float "threshold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_restaurant_levels_on_restaurant_id"
  end

  create_table "restaurant_order_sizes", force: :cascade do |t|
    t.string "name"
    t.integer "restaurant_id"
    t.float "low_limit", default: 0.0
    t.float "high_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_restaurant_order_sizes_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_restaurant_levels", force: :cascade do |t|
    t.integer "user_id"
    t.integer "restaurant_level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_level_id"], name: "index_user_restaurant_levels_on_restaurant_level_id"
    t.index ["user_id"], name: "index_user_restaurant_levels_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "mobile"
    t.float "cb_redeemable", default: 0.0
    t.float "cb_redeemed", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
