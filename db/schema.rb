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

ActiveRecord::Schema.define(version: 20140923024516) do

  create_table "applications", force: true do |t|
    t.string   "coverLetter"
    t.integer  "status"
    t.datetime "dateOfApp"
    t.integer  "jobId"
    t.integer  "userId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applies", force: true do |t|
    t.text     "cover"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "dateOfApp"
  end

  create_table "fields", force: true do |t|
    t.integer  "fieldId"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "employee_id"
    t.integer  "field_id"
    t.string   "title"
    t.date     "deadline"
    t.boolean  "isDeleted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "jobs_tags", id: false, force: true do |t|
    t.integer "job_id"
    t.integer "tag_id"
  end

  add_index "jobs_tags", ["job_id", "tag_id"], name: "index_jobs_tags_on_job_id_and_tag_id"

  create_table "jobseekers", force: true do |t|
    t.string   "search"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "role"
    t.string   "name"
    t.string   "password"
    t.string   "username"
    t.string   "email"
    t.string   "skills"
    t.text     "resume"
    t.string   "contactName"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
