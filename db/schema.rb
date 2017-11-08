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

ActiveRecord::Schema.define(version: 20171108033247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisements", force: :cascade do |t|
    t.string "link", null: false
    t.string "name", null: false
  end

  create_table "cam_models", force: :cascade do |t|
    t.integer "age"
    t.string "chat_room_url_revshare"
    t.string "chat_room_url"
    t.string "current_show"
    t.string "gender"
    t.string "image_url"
    t.string "iframe_embed_revshare"
    t.string "iframe_embed"
    t.boolean "is_hd"
    t.boolean "is_new"
    t.integer "seconds_online"
    t.integer "num_users"
    t.integer "num_followers"
    t.string "location"
    t.string "username"
    t.string "room_subject"
    t.boolean "active"
  end

  create_table "videos", force: :cascade do |t|
    t.string "link", null: false
    t.string "name", null: false
    t.jsonb "metadata"
  end

end
