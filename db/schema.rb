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

ActiveRecord::Schema.define(:version => 20110112131150) do

  create_table "features", :force => true do |t|
    t.string   "subject",                        :null => false
    t.string   "content"
    t.integer  "estimated_hours", :default => 0, :null => false
    t.integer  "product_id"
    t.integer  "sprint_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "code",        :null => false
    t.string   "name",        :null => false
    t.string   "description"
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sprints", :force => true do |t|
    t.string   "code"
    t.date     "begin_date"
    t.date     "end_date"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",            :null => false
    t.string   "full_name"
    t.string   "email",           :null => false
    t.string   "hashed_password", :null => false
    t.string   "salt",            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
