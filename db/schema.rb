# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160229193225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "companies", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.string   "ticker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drugs", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.text     "target"
    t.text     "notes"
    t.uuid     "company_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.uuid     "indication_id"
  end

  add_index "drugs", ["company_id"], name: "index_drugs_on_company_id", using: :btree
  add_index "drugs", ["indication_id"], name: "index_drugs_on_indication_id", using: :btree

  create_table "indications", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "notes"
  end

  create_table "trials", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "phase"
    t.uuid     "drug_id"
    t.jsonb    "attribute_blob", default: {}, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "trials", ["attribute_blob"], name: "index_trials_on_attribute_blob", using: :gin
  add_index "trials", ["drug_id"], name: "index_trials_on_drug_id", using: :btree

end
