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

ActiveRecord::Schema[7.1].define(version: 2024_03_04_162655) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_bookmarks_on_restaurant_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "followers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "followers_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followers_list_id"], name: "index_followers_on_followers_list_id"
    t.index ["user_id"], name: "index_followers_on_user_id"
  end

  create_table "followers_lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_followers_lists_on_user_id"
  end

  create_table "nationalities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "nationalities_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nationalities_list_id"], name: "index_nationalities_on_nationalities_list_id"
    t.index ["user_id"], name: "index_nationalities_on_user_id"
  end

  create_table "nationalities_lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_nationalities_lists_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "cuisine"
    t.string "phone"
    t.string "photo"
    t.text "description"
    t.boolean "take_away"
    t.string "price_catagory"
    t.boolean "authentic_badge"
    t.string "opening_hours"
    t.string "neighborhood"
    t.string "dietary_requirements"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.integer "service"
    t.text "description"
    t.string "photo"
    t.bigint "user_id", null: false
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.text "description"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "restaurants"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "followers", "followers_lists"
  add_foreign_key "followers", "users"
  add_foreign_key "followers_lists", "users"
  add_foreign_key "nationalities", "nationalities_lists"
  add_foreign_key "nationalities", "users"
  add_foreign_key "nationalities_lists", "users"
  add_foreign_key "reviews", "restaurants"
  add_foreign_key "reviews", "users"
end
