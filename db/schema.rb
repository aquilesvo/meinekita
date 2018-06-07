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

ActiveRecord::Schema.define(version: 2018_06_07_093601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "kindergarden_id"
    t.bigint "user_id"
    t.index ["kindergarden_id"], name: "index_bookmarks_on_kindergarden_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "carriers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "subject"
    t.string "content"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "kindergarden_id"
    t.bigint "user_id"
    t.text "alert"
    t.index ["kindergarden_id"], name: "index_inquiries_on_kindergarden_id"
    t.index ["user_id"], name: "index_inquiries_on_user_id"
  end

  create_table "kindergardens", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.integer "children_below_three"
    t.integer "children_above_three"
    t.integer "min_age_months"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.bigint "carrier_id"
    t.integer "plz"
    t.time "mo_o"
    t.time "mo_c"
    t.time "tu_o"
    t.time "tu_c"
    t.time "we_o"
    t.time "we_c"
    t.time "th_o"
    t.time "th_c"
    t.time "fr_o"
    t.time "fr_c"
    t.integer "external_id"
    t.string "weblink"
    t.float "latitude"
    t.float "longitude"
    t.bigint "district_id"
    t.index ["carrier_id"], name: "index_kindergardens_on_carrier_id"
    t.index ["category_id"], name: "index_kindergardens_on_category_id"
    t.index ["district_id"], name: "index_kindergardens_on_district_id"
  end

  create_table "kita_properties", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "kindergarden_id"
    t.bigint "property_id"
    t.index ["kindergarden_id"], name: "index_kita_properties_on_kindergarden_id"
    t.index ["property_id"], name: "index_kita_properties_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "external_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "kindergardens"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "inquiries", "kindergardens"
  add_foreign_key "inquiries", "users"
  add_foreign_key "kindergardens", "districts"
  add_foreign_key "kita_properties", "kindergardens"
  add_foreign_key "kita_properties", "properties"
end
