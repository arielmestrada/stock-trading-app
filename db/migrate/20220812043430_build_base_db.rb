class BuildBaseDb < ActiveRecord::Migration[7.0]
  def change
    create_table "listings", force: :cascade do |t|
      t.string "name"
      t.string "ticker"
      t.float "price"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "iex_volume"
      t.float "previous_close"
      t.float "change"
      t.float "change_percent"
      t.float "market_cap"
      t.float "pe_ratio"
    end
  
    create_table "stocks", force: :cascade do |t|
      t.integer "quantity"
      t.bigint "listing_id", null: false
      t.bigint "user_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["listing_id"], name: "index_stocks_on_listing_id"
      t.index ["user_id"], name: "index_stocks_on_user_id"
    end
  
    create_table "transactions", force: :cascade do |t|
      t.string "transaction_type"
      t.integer "quantity"
      t.float "price"
      t.bigint "user_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "name"
      t.string "ticker"
      t.index ["user_id"], name: "index_transactions_on_user_id"
    end
  
    create_table "users", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "confirmation_token"
      t.datetime "confirmed_at"
      t.datetime "confirmation_sent_at"
      t.string "first_name"
      t.string "last_name"
      t.float "balance"
      t.string "role", default: "trader"
      t.boolean "admin_created", default: false
      t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
  
    add_foreign_key "stocks", "listings"
    add_foreign_key "stocks", "users"
    add_foreign_key "transactions", "users"
  end
end
