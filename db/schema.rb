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

ActiveRecord::Schema.define(version: 20170513020258) do

  create_table "albums", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "primary_photograph_id"
  end

  create_table "albums_photographs", id: false, force: :cascade do |t|
    t.integer "album_id"
    t.integer "photograph_id"
    t.index ["album_id", "photograph_id"], name: "index_albums_photographs_on_album_id_and_photograph_id", unique: true
    t.index ["photograph_id", "album_id"], name: "index_albums_photographs_on_photograph_id_and_album_id", unique: true
  end

  create_table "collaborator_roles", force: :cascade do |t|
    t.integer  "collaborator_id", null: false
    t.integer  "photograph_id",   null: false
    t.string   "title",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["collaborator_id"], name: "index_collaborator_roles_on_collaborator_id"
    t.index ["photograph_id"], name: "index_collaborator_roles_on_photograph_id"
    t.index ["title"], name: "index_collaborator_roles_on_title"
  end

  create_table "collaborators", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photographs", force: :cascade do |t|
    t.date     "taken_on"
    t.string   "title"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "site_image_mappings", force: :cascade do |t|
    t.string  "location_key"
    t.integer "photograph_id"
  end

end
