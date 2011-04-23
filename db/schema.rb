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

ActiveRecord::Schema.define(:version => 20110423092050) do

  create_table "a_posts", :force => true do |t|
    t.text     "message"
    t.string   "ip"
    t.integer  "_id"
    t.integer  "author_id"
    t.integer  "thread_id"
    t.boolean  "hidden",            :default => false
    t.boolean  "sage",              :default => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.text     "file_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "a_threads", :force => true do |t|
    t.text     "message"
    t.string   "title"
    t.string   "ip"
    t.integer  "_id"
    t.integer  "replies_count",     :default => 0
    t.integer  "author_id"
    t.integer  "board_id"
    t.boolean  "hidden",            :default => false
    t.boolean  "sticky",            :default => false
    t.datetime "bump"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.text     "file_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_log_entries", :force => true do |t|
    t.integer  "user_id"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "b_posts", :force => true do |t|
    t.text     "message"
    t.string   "ip"
    t.integer  "_id"
    t.integer  "author_id"
    t.integer  "thread_id"
    t.boolean  "hidden",            :default => false
    t.boolean  "sage",              :default => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.text     "file_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "b_threads", :force => true do |t|
    t.text     "message"
    t.string   "title"
    t.string   "ip"
    t.integer  "_id"
    t.integer  "replies_count",     :default => 0
    t.integer  "author_id"
    t.integer  "board_id"
    t.boolean  "hidden",            :default => false
    t.boolean  "sticky",            :default => false
    t.datetime "bump"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.text     "file_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bb_posts", :force => true do |t|
    t.text     "message"
    t.string   "ip"
    t.integer  "_id"
    t.integer  "author_id"
    t.integer  "thread_id"
    t.boolean  "hidden",            :default => false
    t.boolean  "sage",              :default => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.text     "file_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bb_threads", :force => true do |t|
    t.text     "message"
    t.string   "title"
    t.string   "ip"
    t.integer  "_id"
    t.integer  "replies_count",     :default => 0
    t.integer  "author_id"
    t.integer  "board_id"
    t.boolean  "hidden",            :default => false
    t.boolean  "sticky",            :default => false
    t.datetime "bump"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.text     "file_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boards", :force => true do |t|
    t.string   "alias"
    t.string   "name"
    t.string   "description"
    t.text     "settings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "c_posts", :force => true do |t|
    t.text     "message"
    t.string   "ip"
    t.integer  "_id"
    t.integer  "author_id"
    t.integer  "thread_id"
    t.boolean  "hidden",            :default => false
    t.boolean  "sage",              :default => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.text     "file_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "c_threads", :force => true do |t|
    t.text     "message"
    t.string   "title"
    t.string   "ip"
    t.integer  "_id"
    t.integer  "replies_count",     :default => 0
    t.integer  "author_id"
    t.integer  "board_id"
    t.boolean  "hidden",            :default => false
    t.boolean  "sticky",            :default => false
    t.datetime "bump"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.text     "file_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "d_posts", :force => true do |t|
    t.text     "message"
    t.string   "ip"
    t.integer  "_id"
    t.integer  "author_id"
    t.integer  "thread_id"
    t.boolean  "hidden",            :default => false
    t.boolean  "sage",              :default => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.text     "file_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "d_threads", :force => true do |t|
    t.text     "message"
    t.string   "title"
    t.string   "ip"
    t.integer  "_id"
    t.integer  "replies_count",     :default => 0
    t.integer  "author_id"
    t.integer  "board_id"
    t.boolean  "hidden",            :default => false
    t.boolean  "sticky",            :default => false
    t.datetime "bump"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.text     "file_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ids", :force => true do |t|
    t.text     "ids"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motds", :force => true do |t|
    t.integer  "user_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "s_posts", :force => true do |t|
    t.text     "message"
    t.string   "ip"
    t.integer  "_id"
    t.integer  "author_id"
    t.integer  "thread_id"
    t.boolean  "hidden",            :default => false
    t.boolean  "sage",              :default => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.text     "file_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "s_threads", :force => true do |t|
    t.text     "message"
    t.string   "title"
    t.string   "ip"
    t.integer  "_id"
    t.integer  "replies_count",     :default => 0
    t.integer  "author_id"
    t.integer  "board_id"
    t.boolean  "hidden",            :default => false
    t.boolean  "sticky",            :default => false
    t.datetime "bump"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.text     "file_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
