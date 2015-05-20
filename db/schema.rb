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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150518130907) do
=======
ActiveRecord::Schema.define(version: 20150506225935) do
>>>>>>> origin/master

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "c_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "change_types", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "changes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "priority_id"
    t.integer  "user_id"
    t.string   "status"
    t.string   "confirmed"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "c_type_id"
  end

  add_index "changes", ["c_type_id"], name: "index_changes_on_c_type_id", using: :btree
  add_index "changes", ["category_id"], name: "index_changes_on_category_id", using: :btree
  add_index "changes", ["priority_id"], name: "index_changes_on_priority_id", using: :btree
  add_index "changes", ["user_id"], name: "index_changes_on_user_id", using: :btree

  create_table "incidents", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "priority_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "confirmed",   default: "/"
    t.string   "solution"
  end

  add_index "incidents", ["category_id"], name: "index_incidents_on_category_id", using: :btree
  add_index "incidents", ["priority_id"], name: "index_incidents_on_priority_id", using: :btree
  add_index "incidents", ["user_id"], name: "index_incidents_on_user_id", using: :btree

  create_table "priorities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "problems", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "priority_id"
    t.integer  "user_id"
    t.string   "confirmed"
    t.string   "solution"
    t.string   "approved"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
  end

  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

end
