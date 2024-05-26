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

ActiveRecord::Schema[7.1].define(version: 2023_09_22_050355) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_details", force: :cascade do |t|
    t.bigint "carts_id", null: false
    t.bigint "products_id", null: false
    t.integer "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carts_id"], name: "index_cart_details_on_carts_id"
    t.index ["products_id"], name: "index_cart_details_on_products_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "customers_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customers_id"], name: "index_carts_on_customers_id"
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "customer_name"
    t.integer "postal_code"
    t.string "prefecture"
    t.string "address1"
    t.string "address2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.bigint "orders_id", null: false
    t.bigint "products_id", null: false
    t.integer "num", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orders_id"], name: "index_order_details_on_orders_id"
    t.index ["products_id"], name: "index_order_details_on_products_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "billing_amount"
    t.string "postage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "seller_id", null: false
    t.string "name", null: false
    t.string "picture", null: false
    t.integer "price", null: false
    t.integer "sale_price"
    t.integer "stock", null: false
    t.text "description", null: false
    t.string "category", null: false
    t.string "tag", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_products_on_seller_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "order_details_id", null: false
    t.text "content"
    t.integer "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_details_id"], name: "index_reviews_on_order_details_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.string "seller_name"
    t.string "description"
    t.integer "postal_code"
    t.string "prefecture"
    t.string "address1"
    t.string "address2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_sellers_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "cart_details", "carts", column: "carts_id"
  add_foreign_key "cart_details", "products", column: "products_id"
  add_foreign_key "carts", "customers", column: "customers_id"
  add_foreign_key "customers", "users"
  add_foreign_key "order_details", "orders", column: "orders_id"
  add_foreign_key "order_details", "products", column: "products_id"
  add_foreign_key "orders", "customers"
  add_foreign_key "products", "sellers"
  add_foreign_key "reviews", "order_details", column: "order_details_id"
  add_foreign_key "sellers", "users", column: "users_id"
end
