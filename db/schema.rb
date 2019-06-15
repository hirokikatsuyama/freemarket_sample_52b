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

ActiveRecord::Schema.define(version: 2019_06_15_050618) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "postal"
    t.string "prefecture"
    t.string "city"
    t.string "address"
    t.string "building"
    t.integer "phone"
    t.bigint "user_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id_id"], name: "index_addresses_on_user_id_id"
  end

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "brands_group_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brands_group_id_id"], name: "index_brands_on_brands_group_id_id"
  end

  create_table "brands_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "text"
    t.bigint "user_id_id"
    t.bigint "item_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id_id"], name: "index_comments_on_item_id_id"
    t.index ["user_id_id"], name: "index_comments_on_user_id_id"
  end

  create_table "credits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "card_number"
    t.string "expiration_date_month"
    t.string "expiration_date_year"
    t.string "security_code"
    t.bigint "user_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id_id"], name: "index_credits_on_user_id_id"
  end

  create_table "evaluations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "evaluation"
    t.integer "date"
    t.bigint "user_id_id"
    t.bigint "transaction_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_id_id"], name: "index_evaluations_on_transaction_id_id"
    t.index ["user_id_id"], name: "index_evaluations_on_user_id_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image"
    t.bigint "item_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id_id"], name: "index_images_on_item_id_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "detail"
    t.string "condition"
    t.string "shipping_cost"
    t.string "shipping_method"
    t.string "shipping_source"
    t.string "delivery_date"
    t.string "shopping_status"
    t.integer "price"
    t.integer "tax"
    t.integer "profit"
    t.integer "status"
    t.bigint "user_id_id"
    t.bigint "brand_id_id"
    t.bigint "small_category_id_id"
    t.bigint "size_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id_id"], name: "index_items_on_brand_id_id"
    t.index ["size_id_id"], name: "index_items_on_size_id_id"
    t.index ["small_category_id_id"], name: "index_items_on_small_category_id_id"
    t.index ["user_id_id"], name: "index_items_on_user_id_id"
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id_id"
    t.bigint "item_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id_id"], name: "index_likes_on_item_id_id"
    t.index ["user_id_id"], name: "index_likes_on_user_id_id"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "family_name"
    t.string "first_name_kana"
    t.string "family_name_kana"
    t.text "introduction"
    t.integer "birthday_year"
    t.integer "birthday_month"
    t.integer "bithday_day"
    t.bigint "user_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id_id"], name: "index_profiles_on_user_id_id"
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id_id"
    t.bigint "buyer_id_id"
    t.bigint "seller_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id_id"], name: "index_transactions_on_buyer_id_id"
    t.index ["item_id_id"], name: "index_transactions_on_item_id_id"
    t.index ["seller_id_id"], name: "index_transactions_on_seller_id_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "views", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_views_on_email", unique: true
    t.index ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true
  end

end
