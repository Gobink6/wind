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

ActiveRecord::Schema.define(version: 2018_08_23_044733) do

  create_table "alarmlogs", force: :cascade do |t|
    t.string "windmillid"
    t.string "timestamp"
    t.string "alarmlog"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "electricals", force: :cascade do |t|
    t.string "data"
    t.string "windmillid"
    t.string "power"
    t.string "cosphi"
    t.string "frequency"
    t.string "l1v"
    t.string "l2v"
    t.string "l3v"
    t.string "l1a"
    t.string "l2a"
    t.string "l3a"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hoursecounts", force: :cascade do |t|
    t.string "windmillid"
    t.string "timestamp"
    t.string "total"
    t.string "lineok"
    t.string "turbineok"
    t.string "run"
    t.string "genone"
    t.string "gentwo"
    t.string "ambient"
    t.string "line"
    t.string "yawing"
    t.string "service"
    t.string "disp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logbooks", force: :cascade do |t|
    t.string "windmillid"
    t.string "timestamp"
    t.string "logbook"
    t.string "alaram_log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", force: :cascade do |t|
    t.string "windmill_id"
    t.string "log"
    t.string "alaram_log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productions", force: :cascade do |t|
    t.string "windmill_id"
    t.string "gen0_react"
    t.string "gen1_react"
    t.string "gen2_react"
    t.string "prod_react"
    t.string "gen0_activ"
    t.string "gen1_activ"
    t.string "gen2_activ"
    t.string "prod_activ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registers", force: :cascade do |t|
    t.string "name"
    t.string "emailid"
    t.string "phone"
    t.string "role"
    t.string "windformid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "windmillid"
    t.string "status"
    t.string "power"
    t.string "gen"
    t.string "frequency"
    t.string "rotor"
    t.string "wind"
    t.string "pitch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "streams", force: :cascade do |t|
    t.string "windmillid"
    t.string "ambi"
    t.string "genonetemp"
    t.string "gentwo"
    t.string "nacel"
    t.string "cntrl"
    t.string "hydr"
    t.string "gear"
    t.string "bear"
    t.string "windspeed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string "no"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userdets", force: :cascade do |t|
    t.string "usid"
    t.string "windmill"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "windfrom"
    t.string "mobile_token"
    t.boolean "action"
  end

  create_table "users", force: :cascade do |t|
    t.string "userid"
    t.string "windmillid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "windforms", force: :cascade do |t|
    t.string "no"
    t.string "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "windmills", force: :cascade do |t|
    t.string "no"
    t.string "windformid"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "latitude"
    t.string "londitude"
    t.string "name"
    t.string "status"
    t.string "status_one"
    t.string "customer_name"
    t.string "sf_no"
    t.string "htfc_no"
    t.string "village"
  end

end
