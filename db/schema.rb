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

ActiveRecord::Schema.define(version: 2022_03_31_234421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_us_pages", force: :cascade do |t|
    t.string "heading_image"
    t.string "heading"
    t.string "about_text"
    t.string "mission_text"
    t.string "club_image_1"
    t.string "club_image_2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "about_us_pages_officer_bios", id: false, force: :cascade do |t|
    t.bigint "about_us_page_id", null: false
    t.bigint "officer_bio_id", null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "contact_forms", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "company"
    t.string "message"
    t.datetime "date_submitted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.boolean "attended"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_users_on_event_id"
    t.index ["user_id"], name: "index_event_users_on_user_id"
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
    t.string "password"
    t.bigint "attendance_count", default: 0, null: false
  end

  create_table "home_pages", force: :cascade do |t|
    t.string "slider_image_1"
    t.string "slider_image_2"
    t.string "slider_image_3"
    t.string "slider_image_4"
    t.string "slider_image_5"
    t.string "heading"
    t.string "summary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "officer_bios", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "bio_text"
    t.string "portrait_image"
    t.boolean "visible"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_officer_bios_on_user_id"
  end

  create_table "paymentAccount", force: :cascade do |t|
    t.string "internalName"
    t.string "paymentAddress"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_accounts", force: :cascade do |t|
    t.string "internal_name"
    t.string "payment_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "semester_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "semester_id", null: false
    t.boolean "paid_dues"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["semester_id"], name: "index_semester_users_on_semester_id"
    t.index ["user_id"], name: "index_semester_users_on_user_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.string "name"
    t.datetime "start"
    t.datetime "end"
    t.float "duescost"
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
    t.boolean "is_current_member", default: true, null: false
    t.boolean "has_paid_dues", default: false
    t.bigint "transaction_amount"
    t.bigint "transaction_last_4"
    t.datetime "transaction_date"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
