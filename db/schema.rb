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

ActiveRecord::Schema.define(version: 2021_12_22_121137) do

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "username"
    t.string "blood_group"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "userdonations", force: :cascade do |t|
    t.string "username"
    t.string "blood_group"
    t.string "camp"
    t.integer "donated"
    t.integer "received"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "blood_group"
    t.string "gender"
    t.string "street"
    t.string "additional_info"
    t.string "pin_code"
    t.string "city"
    t.string "country"
    t.string "code"
    t.integer "phone_no"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

end
