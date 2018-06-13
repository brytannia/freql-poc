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

ActiveRecord::Schema.define(version: 2018_06_13_121752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bounties", force: :cascade do |t|
    t.bigint "issue_id"
    t.bigint "master_id"
    t.integer "sum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_id"], name: "index_bounties_on_issue_id"
    t.index ["master_id"], name: "index_bounties_on_master_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.float "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "lang_id"
    t.string "desc_url"
    t.integer "status"
    t.string "name"
    t.string "description"
    t.bigint "publisher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lang_id"], name: "index_issues_on_lang_id"
    t.index ["project_id"], name: "index_issues_on_project_id"
    t.index ["publisher_id"], name: "index_issues_on_publisher_id"
  end

  create_table "langs", force: :cascade do |t|
    t.string "name"
  end

  create_table "project_langs", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "lang_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lang_id"], name: "index_project_langs_on_lang_id"
    t.index ["project_id"], name: "index_project_langs_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "repo_url"
    t.bigint "main_lang_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["main_lang_id"], name: "index_projects_on_main_lang_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
