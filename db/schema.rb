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

ActiveRecord::Schema.define(version: 20131225032052) do

  create_table "authors", force: true do |t|
    t.integer  "book_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["book_id"], name: "index_authors_on_book_id"

  create_table "books", force: true do |t|
    t.string "title"
    t.string "asin"
    t.string "isbn"
    t.string "s_image"
    t.string "m_image"
    t.string "l_image"
    t.date   "publication_date"
    t.string "product_group"
  end

  create_table "publishers", force: true do |t|
    t.integer  "book_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publishers", ["book_id"], name: "index_publishers_on_book_id"

  create_table "readings", force: true do |t|
    t.integer  "book_id"
    t.date     "started_on"
    t.date     "finished_on"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "readings", ["book_id"], name: "index_readings_on_book_id"

end
