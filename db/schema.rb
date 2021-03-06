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

ActiveRecord::Schema.define(version: 20160920032721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_sessions", force: :cascade do |t|
    t.integer  "wizard_id"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wizard_id"], name: "index_answer_sessions_on_wizard_id", using: :btree
  end

  create_table "answers", force: :cascade do |t|
    t.string   "owner_type"
    t.integer  "owner_id"
    t.integer  "question_id"
    t.string   "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["owner_type", "owner_id"], name: "index_answers_on_owner_type_and_owner_id", using: :btree
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "conditions", force: :cascade do |t|
    t.integer  "source_id"
    t.string   "conditional_type"
    t.integer  "conditional_id"
    t.string   "operator"
    t.jsonb    "meta"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["conditional_type", "conditional_id"], name: "index_conditions_on_conditional_type_and_conditional_id", using: :btree
    t.index ["source_id"], name: "index_conditions_on_source_id", using: :btree
  end

  create_table "interpolations", force: :cascade do |t|
    t.integer  "wizard_id"
    t.integer  "source_id"
    t.string   "name"
    t.jsonb    "meta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_interpolations_on_source_id", using: :btree
    t.index ["wizard_id"], name: "index_interpolations_on_wizard_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "wizard_id"
    t.string   "type"
    t.integer  "order_num"
    t.text     "prompt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb    "meta"
    t.index ["wizard_id"], name: "index_questions_on_wizard_id", using: :btree
  end

  create_table "result_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "description"
    t.string   "rationale"
    t.integer  "wizard_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["wizard_id"], name: "index_result_categories_on_wizard_id", using: :btree
  end

  create_table "result_groups", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "result_category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["result_category_id"], name: "index_result_groups_on_result_category_id", using: :btree
  end

  create_table "results", force: :cascade do |t|
    t.integer  "wizard_id"
    t.string   "type"
    t.string   "title"
    t.jsonb    "meta"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "container_type"
    t.integer  "container_id"
    t.index ["container_type", "container_id"], name: "index_results_on_container_type_and_container_id", using: :btree
    t.index ["wizard_id"], name: "index_results_on_wizard_id", using: :btree
  end

  create_table "wizards", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "questions", "wizards"
  add_foreign_key "result_categories", "wizards"
  add_foreign_key "result_groups", "result_categories"
  add_foreign_key "results", "wizards"
end
