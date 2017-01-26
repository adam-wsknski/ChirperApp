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

ActiveRecord::Schema.define(version: 20170126121552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree
    t.index ["user_id"], name: "index_microposts_on_user_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
    t.index ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", using: :btree
  end

  create_table "weather", id: false, force: :cascade do |t|
    t.date    "cet"
    t.integer "temperatura_maksymalnac"
    t.integer "temperatura_sredniac"
    t.integer "temperatura_minimalnac"
    t.integer "punkt_rosyc"
    t.integer "meandew_pointc"
    t.integer "min_dewpointc"
    t.integer "max_wilgotnosc"
    t.integer "mean_wilgotnosc"
    t.integer "min_wilgotnosc"
    t.float   "max_cisnienie_na_poziomi_morzahpa"
    t.float   "mean_cisnienie_na_poziomie_morzahpa"
    t.float   "min_cisnienie_na_poziomie_morzahpa_"
    t.integer "max_widzialnosckm"
    t.integer "mean_widzialnosckm"
    t.integer "min_widzialnosckm"
    t.integer "max_predkosc_wiatru_km_h"
    t.integer "mean_predkosc_wiatru_km_h"
    t.integer "max_predkosc_w_porywie_km_h"
    t.float   "opadymm"
    t.integer "cloudcover"
    t.string  "wydarzenia",                          limit: 50
    t.integer "winddirdegrees"
  end

  add_foreign_key "microposts", "users"
end
