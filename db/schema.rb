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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131018012159) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "closed"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "sponsor_id"
    t.integer  "activity_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "department_id"
    t.integer  "project_type_id"
    t.integer  "in_epm"
    t.integer  "pm_id"
  end

  add_index "projects", ["activity_id"], :name => "index_projects_on_activity_id"
  add_index "projects", ["sponsor_id"], :name => "index_projects_on_sponsor_id"

  create_table "report_periods", :force => true do |t|
    t.date     "week_ending"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "risk_summaries", :force => true do |t|
    t.integer  "project_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "riskfile_file_name"
    t.string   "riskfile_content_type"
    t.integer  "riskfile_file_size"
    t.datetime "riskfile_updated_at"
  end

  add_index "risk_summaries", ["project_id"], :name => "index_risk_summaries_on_project_id"

  create_table "sponsors", :force => true do |t|
    t.string   "name"
    t.string   "initials"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "status_reports", :force => true do |t|
    t.integer  "project_id"
    t.text     "highlight"
    t.text     "issues_risks"
    t.text     "next_steps"
    t.text     "remarks"
    t.integer  "status_id"
    t.integer  "report_period_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "status_reports", ["project_id"], :name => "index_status_reports_on_project_id"
  add_index "status_reports", ["report_period_id"], :name => "index_status_reports_on_report_period_id"
  add_index "status_reports", ["status_id"], :name => "index_status_reports_on_status_id"

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.string   "icon_url"
    t.integer  "sort_index"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "role"
  end

  create_table "web_pages", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.text     "page_html"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
