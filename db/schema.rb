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

ActiveRecord::Schema.define(version: 20170426100953) do

  create_table "assign_course_to_semesters", force: :cascade do |t|
    t.integer  "semester_id"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "course_id"
    t.string   "course_name"
    t.float    "credit"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "global_settings", force: :cascade do |t|
    t.integer  "semester_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "registration_informations", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "semester_id"
    t.integer  "course_id"
    t.float    "mark"
    t.string   "grade"
    t.float    "gpa"
    t.float    "cgpa"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.string   "semester_id"
    t.string   "semester_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "user_id",                                    null: false
    t.string   "user_name",              default: "",        null: false
    t.string   "picture",                default: "",        null: false
    t.string   "email",                  default: "",        null: false
    t.string   "mobile",                 default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "role",                   default: "Student"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
