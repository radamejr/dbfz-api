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

ActiveRecord::Schema.define(version: 2020_09_25_004049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assists", force: :cascade do |t|
    t.string "startup"
    t.string "blockstun"
    t.string "active"
    t.string "onscreen"
    t.string "hitstop"
    t.string "special_notes"
    t.integer "character_id"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hit_stun"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.boolean "dlc", default: false
    t.string "discord_link"
    t.string "combo_doc_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
    t.string "character_picture"
    t.string "twitter_tag"
    t.text "about"
  end

  create_table "normals", force: :cascade do |t|
    t.string "input"
    t.string "startup"
    t.string "active"
    t.string "recovery"
    t.string "advantage"
    t.string "immune_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "character_id"
    t.string "picture"
    t.string "gaurd"
    t.string "properties"
    t.text "special_notes"
    t.string "move_type"
    t.integer "list_order"
  end

  create_table "special_variants", force: :cascade do |t|
    t.string "input_type"
    t.string "startup"
    t.string "recovery"
    t.string "active"
    t.string "advantage"
    t.string "immune_to"
    t.integer "meter_used"
    t.string "gaurd"
    t.string "properties"
    t.string "special_notes"
    t.integer "special_id"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specials", force: :cascade do |t|
    t.string "name"
    t.string "input"
    t.integer "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.text "special_notes"
  end

  create_table "super_variants", force: :cascade do |t|
    t.string "input_type"
    t.string "startup"
    t.string "recovery"
    t.string "active"
    t.string "advantage"
    t.string "immune_to"
    t.integer "meter_used"
    t.string "gaurd"
    t.string "properties"
    t.string "special_notes"
    t.integer "super_id"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "input"
    t.string "startup"
    t.string "recovery"
    t.string "advantage"
    t.string "immune_to"
    t.integer "character_id"
    t.integer "meter_used"
    t.string "picture"
    t.string "gaurd"
    t.string "properties"
    t.text "special_notes"
    t.string "active"
    t.integer "raw_damage"
    t.integer "scaled_damage"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
