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

ActiveRecord::Schema.define(version: 20140201073550) do

  create_table "amazonitems", force: true do |t|
    t.string   "asin",             null: false
    t.text     "detailpageurl"
    t.string   "isbn"
    t.string   "title"
    t.string   "author"
    t.string   "publisher"
    t.string   "product_group"
    t.string   "publication_date"
    t.text     "s_image_url"
    t.text     "m_image_url"
    t.text     "l_image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authors", force: true do |t|
    t.integer  "book_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["book_id"], name: "index_authors_on_book_id"

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "asin"
    t.string   "isbn"
    t.string   "s_image"
    t.string   "m_image"
    t.string   "l_image"
    t.date     "publication_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
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

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
