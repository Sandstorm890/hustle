# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_24_005743) do

  create_table "employers", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "company"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "bio"
    t.integer "job_id"
    t.string "first_name"
    t.string "last_name"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "category"
    t.datetime "start_date"
    t.datetime "end_date"
    t.float "rate"
    t.string "requirements"
    t.integer "user_id"
    t.integer "employer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
  end

  create_table "jobs_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "job_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_jobs_users_on_job_id"
    t.index ["user_id"], name: "index_jobs_users_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "category"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tools", force: :cascade do |t|
    t.string "category"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "tools_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tool_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tool_id"], name: "index_tools_users_on_tool_id"
    t.index ["user_id"], name: "index_tools_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "job_id"
    t.integer "tool_id"
    t.string "uid"
    t.string "provider"
    t.string "first_name"
    t.string "last_name"
  end

end
