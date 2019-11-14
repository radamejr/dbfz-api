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

ActiveRecord::Schema.define(version: 2019_11_14_171444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.boolean "dlc", default: false
    t.string "discord_link"
    t.string "combo_doc_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "normals", force: :cascade do |t|
    t.string "input"
    t.integer "startup_frames"
    t.integer "active_frames"
    t.integer "recovery_on_hit"
    t.integer "recovery_on_block"
    t.integer "recovery_on_whiff"
    t.string "cancellable", default: ""
    t.integer "blockstun"
    t.string "immune_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "character_id"
  end

  create_table "supers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "input"
    t.integer "startup_frames"
    t.integer "recovery_on_hit"
    t.integer "recovery_on_block"
    t.integer "recovery_on_whiff"
    t.string "cancellable"
    t.integer "blockstun"
    t.string "immune_to"
    t.integer "character_id"
    t.integer "meter_used"
  end

end
