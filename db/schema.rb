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

ActiveRecord::Schema.define(version: 2019_12_14_175925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.boolean "dlc", default: false
    t.string "discord_link"
    t.string "combo_doc_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
    t.string "character_picture"
  end

  create_table "normals", force: :cascade do |t|
    t.string "input"
    t.integer "startup"
    t.integer "active"
    t.integer "recovery"
    t.integer "advantage"
    t.string "immune_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "character_id"
    t.string "picture"
    t.string "gaurd"
    t.string "properties"
    t.text "special_notes"
    t.string "move_type"
  end

  create_table "specials", force: :cascade do |t|
    t.string "name"
    t.string "input"
    t.integer "startup"
    t.integer "recovery"
    t.integer "advantage"
    t.string "immune_to"
    t.integer "character_id"
    t.integer "meter_used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.string "gaurd"
    t.string "properties"
    t.text "special_notes"
    t.string "active"
  end

  create_table "supers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "input"
    t.integer "startup"
    t.integer "recovery"
    t.integer "advantage"
    t.string "immune_to"
    t.integer "character_id"
    t.integer "meter_used"
    t.string "picture"
    t.string "gaurd"
    t.string "properties"
    t.text "special_notes"
    t.string "active"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.boolean "admin", default: false
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
