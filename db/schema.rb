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

ActiveRecord::Schema.define(version: 2022_02_14_055712) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_us", force: :cascade do |t|
    t.string "heading_image"
    t.text "heading"
    t.text "about_text"
    t.text "mission_text"
    t.string "club_image_1"
    t.string "club_image_2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contact_forms", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "company"
    t.text "message"
    t.string "date_submitted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "time"
    t.string "location"
    t.string "link"
    t.boolean "is_mandatory"
    t.boolean "is_recurring"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "homes", force: :cascade do |t|
    t.string "slider_image_1"
    t.string "slider_image_2"
    t.string "slider_image_3"
    t.string "slider_image_4"
    t.string "slider_image_5"
    t.text "heading"
    t.text "summary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "member"
    t.bigint "attendance_count", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
