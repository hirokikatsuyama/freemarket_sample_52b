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

ActiveRecord::Schema.define(version: 2019_06_18_112553) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "postal"
    t.string "prefecture"
    t.string "city"
    t.string "address"
    t.string "building"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brands_group_id"
    t.index ["brands_group_id"], name: "index_brands_on_brands_group_id"
  end

  create_table "brands_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "item_id"
    t.index ["item_id"], name: "index_comments_on_item_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "credits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "card_number"
    t.string "expiration_date_month"
    t.string "expiration_date_year"
    t.string "security_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_credits_on_user_id"
  end

  create_table "evaluations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "evaluation"
    t.integer "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "transaction_id"
    t.index ["transaction_id"], name: "index_evaluations_on_transaction_id"
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id"
    t.index ["item_id"], name: "index_images_on_item_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.bigint "user_id"
    t.bigint "brand_id"
    t.bigint "size_id"
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["size_id"], name: "index_items_on_size_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "item_id"
    t.index ["item_id"], name: "index_likes_on_item_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "buyer_id"
    t.bigint "seller_id"
    t.bigint "item_id"
    t.index ["buyer_id"], name: "index_transactions_on_buyer_id"
    t.index ["item_id"], name: "index_transactions_on_item_id"
    t.index ["seller_id"], name: "index_transactions_on_seller_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.text "avater_image"
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "brands", "brands_groups"
  add_foreign_key "comments", "items"
  add_foreign_key "comments", "users"
  add_foreign_key "credits", "users"
  add_foreign_key "evaluations", "transactions"
  add_foreign_key "evaluations", "users"
  add_foreign_key "images", "items"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "sizes"
  add_foreign_key "items", "users"
  add_foreign_key "likes", "items"
  add_foreign_key "likes", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "transactions", "items"
  add_foreign_key "transactions", "users", column: "buyer_id"
  add_foreign_key "transactions", "users", column: "seller_id"
end
