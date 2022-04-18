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

ActiveRecord::Schema.define(version: 2022_04_18_031849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "excerpts", force: :cascade do |t|
    t.text "content"
    t.integer "length"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "novel_region"
    t.text "paragraph_region"
  end

  create_table "excerpts_novels", id: false, force: :cascade do |t|
    t.integer "excerpt_id"
    t.integer "novel_id"
  end

  create_table "novels", force: :cascade do |t|
    t.text "content"
    t.integer "upvotes", default: 0
    t.text "cover"
    t.text "title"
    t.text "blurb"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "word_count"
  end

  create_table "novels_pseudousers", id: false, force: :cascade do |t|
    t.integer "novel_id"
    t.integer "pseudouser_id"
  end

  create_table "pseudousers", force: :cascade do |t|
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "email"
    t.text "name"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
