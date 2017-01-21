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

ActiveRecord::Schema.define(version: 20170121114443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
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

end
