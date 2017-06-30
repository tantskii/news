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

ActiveRecord::Schema.define(version: 20170630122120) do

  create_table "information_source_users", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "information_source_id"
    t.integer  "user_id"
    t.index ["information_source_id"], name: "index_information_source_users_on_information_source_id"
    t.index ["user_id", "information_source_id"], name: "index_inf_src_users_on_user_id_and_information_source_id", unique: true
    t.index ["user_id"], name: "index_information_source_users_on_user_id"
  end

  create_table "information_sources", force: :cascade do |t|
    t.string   "rss"
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interest_users", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "interest_id"
    t.integer  "user_id"
    t.index ["interest_id"], name: "index_interest_users_on_interest_id"
    t.index ["user_id", "interest_id"], name: "index_interest_users_on_user_id_and_interest_id", unique: true
    t.index ["user_id"], name: "index_interest_users_on_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string   "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.string   "description"
    t.string   "pub_date"
    t.string   "photo"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
    t.integer  "information_source_id"
    t.index ["information_source_id"], name: "index_posts_on_information_source_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
