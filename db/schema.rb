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

ActiveRecord::Schema.define(:version => 20120324051328) do

  create_table "blsjobs", :force => true do |t|
    t.string  "bls_job_code"
    t.string  "occupation1"
    t.string  "occupation2"
    t.string  "occupation3"
    t.string  "occupation4"
    t.integer "workers_all"
    t.integer "earnings_all"
    t.integer "workers_men"
    t.integer "earnings_men"
    t.integer "workers_women"
    t.integer "earnings_women"
  end

  create_table "salary_com_jobs", :force => true do |t|
    t.string   "title"
    t.string   "code"
    t.string   "bls_job_code"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "zips", :force => true do |t|
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.string   "locationtext"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
