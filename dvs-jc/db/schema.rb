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

ActiveRecord::Schema.define(:version => 20120725055337) do

  create_table "jc_absences", :force => true do |t|
    t.date     "day"
    t.integer  "student_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "jc_absences", ["student_id", "day"], :name => "index_jc_absences_on_student_id_and_day", :unique => true

  create_table "jc_memberships", :force => true do |t|
    t.integer  "student_id"
    t.integer  "jc_term_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "jc_memberships", ["jc_term_id", "student_id"], :name => "index_jc_memberships_on_jc_term_id_and_student_id", :unique => true
  add_index "jc_memberships", ["student_id"], :name => "index_jc_memberships_on_student_id"

  create_table "jc_substitutions", :force => true do |t|
    t.date     "day"
    t.integer  "student_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "jc_substitutions", ["student_id", "day"], :name => "index_jc_substitutions_on_student_id_and_day", :unique => true

  create_table "jc_terms", :force => true do |t|
    t.date     "start_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "jc_terms", ["start_date"], :name => "index_jc_terms_on_start_date", :unique => true

  create_table "students", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.integer  "jc_days_sentenced"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
