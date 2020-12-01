# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_30_203410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories_date_activities", force: :cascade do |t|
    t.bigint "date_activity_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_categories_date_activities_on_category_id"
    t.index ["date_activity_id"], name: "index_categories_date_activities_on_date_activity_id"
  end

  create_table "date_activities", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "confirmed"
    t.string "location"
    t.integer "price"
    t.json "availability"
    t.boolean "reservation"
    t.string "reservation_url"
    t.string "contact_email"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_date_activities_on_user_id"
  end

  create_table "date_activities_packages", force: :cascade do |t|
    t.bigint "package_id", null: false
    t.bigint "date_activity_id", null: false
    t.index ["date_activity_id"], name: "index_date_activities_packages_on_date_activity_id"
    t.index ["package_id"], name: "index_date_activities_packages_on_package_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories_date_activities", "categories"
  add_foreign_key "categories_date_activities", "date_activities"
  add_foreign_key "date_activities", "users"
  add_foreign_key "date_activities_packages", "date_activities"
  add_foreign_key "date_activities_packages", "packages"
  add_foreign_key "reviews", "users"
end
