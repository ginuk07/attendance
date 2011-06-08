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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110608183446) do

  create_table "assignments", :force => true do |t|
    t.integer  "client_id"
    t.string   "status"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classifications", :force => true do |t|
    t.string   "display_name"
    t.string   "name"
    t.decimal  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.date     "admission_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "classification_id"
    t.date     "discharge_date"
    t.date     "iep_date"
    t.integer  "school_id"
  end

  add_index "clients", ["name"], :name => "name_index", :unique => true

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schools", ["name"], :name => "index_schools_on_name", :unique => true

end
