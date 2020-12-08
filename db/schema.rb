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

ActiveRecord::Schema.define(version: 2020_12_08_072631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "start_time"
    t.bigint "mentor_id"
    t.bigint "apprentice_id"
    t.bigint "place_id"
    t.bigint "talent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_mentor_validate", default: false
    t.boolean "is_paid", default: false
    t.index ["apprentice_id"], name: "index_appointments_on_apprentice_id"
    t.index ["mentor_id"], name: "index_appointments_on_mentor_id"
    t.index ["place_id"], name: "index_appointments_on_place_id"
    t.index ["talent_id"], name: "index_appointments_on_talent_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "talent_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["talent_id"], name: "index_bookmarks_on_talent_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "join_table_talent_categories", force: :cascade do |t|
    t.bigint "talent_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_join_table_talent_categories_on_category_id"
    t.index ["talent_id"], name: "index_join_table_talent_categories_on_talent_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "talent_id"
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_messages_on_recipient_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
    t.index ["talent_id"], name: "index_messages_on_talent_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "city_name"
    t.string "zip_code"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "mark"
    t.string "comment"
    t.bigint "appointment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_reviews_on_appointment_id"
  end

  create_table "talents", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "duration"
    t.bigint "place_id"
    t.decimal "price"
    t.index ["place_id"], name: "index_talents_on_place_id"
    t.index ["user_id"], name: "index_talents_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.bigint "place_id"
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["place_id"], name: "index_users_on_place_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "join_table_talent_categories", "categories"
  add_foreign_key "join_table_talent_categories", "talents"
  add_foreign_key "reviews", "appointments"
  add_foreign_key "talents", "places"
  add_foreign_key "talents", "users"
  add_foreign_key "users", "places"
end
