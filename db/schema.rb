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

ActiveRecord::Schema.define(:version => 6) do

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

  add_index "a_posts", ["_id"], :name => "index_a_posts_on__id", :unique => true
  add_index "a_posts", ["author_id"], :name => "index_a_posts_on_author_id"
  add_index "a_posts", ["hidden"], :name => "index_a_posts_on_hidden"
  add_index "a_posts", ["ip"], :name => "index_a_posts_on_ip"
  add_index "a_posts", ["thread_id"], :name => "index_a_posts_on_thread_id"

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

  add_index "a_threads", ["_id"], :name => "index_a_threads_on__id", :unique => true
  add_index "a_threads", ["author_id"], :name => "index_a_threads_on_author_id"
  add_index "a_threads", ["hidden"], :name => "index_a_threads_on_hidden"
  add_index "a_threads", ["ip"], :name => "index_a_threads_on_ip"

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

  add_index "b_posts", ["_id"], :name => "index_b_posts_on__id", :unique => true
  add_index "b_posts", ["author_id"], :name => "index_b_posts_on_author_id"
  add_index "b_posts", ["hidden"], :name => "index_b_posts_on_hidden"
  add_index "b_posts", ["ip"], :name => "index_b_posts_on_ip"
  add_index "b_posts", ["thread_id"], :name => "index_b_posts_on_thread_id"

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

  add_index "b_threads", ["_id"], :name => "index_b_threads_on__id", :unique => true
  add_index "b_threads", ["author_id"], :name => "index_b_threads_on_author_id"
  add_index "b_threads", ["hidden"], :name => "index_b_threads_on_hidden"
  add_index "b_threads", ["ip"], :name => "index_b_threads_on_ip"

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

  add_index "bb_posts", ["_id"], :name => "index_bb_posts_on__id", :unique => true
  add_index "bb_posts", ["author_id"], :name => "index_bb_posts_on_author_id"
  add_index "bb_posts", ["hidden"], :name => "index_bb_posts_on_hidden"
  add_index "bb_posts", ["ip"], :name => "index_bb_posts_on_ip"
  add_index "bb_posts", ["thread_id"], :name => "index_bb_posts_on_thread_id"

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

  add_index "bb_threads", ["_id"], :name => "index_bb_threads_on__id", :unique => true
  add_index "bb_threads", ["author_id"], :name => "index_bb_threads_on_author_id"
  add_index "bb_threads", ["hidden"], :name => "index_bb_threads_on_hidden"
  add_index "bb_threads", ["ip"], :name => "index_bb_threads_on_ip"

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

  add_index "c_posts", ["_id"], :name => "index_c_posts_on__id", :unique => true
  add_index "c_posts", ["author_id"], :name => "index_c_posts_on_author_id"
  add_index "c_posts", ["hidden"], :name => "index_c_posts_on_hidden"
  add_index "c_posts", ["ip"], :name => "index_c_posts_on_ip"
  add_index "c_posts", ["thread_id"], :name => "index_c_posts_on_thread_id"

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

  add_index "c_threads", ["_id"], :name => "index_c_threads_on__id", :unique => true
  add_index "c_threads", ["author_id"], :name => "index_c_threads_on_author_id"
  add_index "c_threads", ["hidden"], :name => "index_c_threads_on_hidden"
  add_index "c_threads", ["ip"], :name => "index_c_threads_on_ip"

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

  add_index "d_posts", ["_id"], :name => "index_d_posts_on__id", :unique => true
  add_index "d_posts", ["author_id"], :name => "index_d_posts_on_author_id"
  add_index "d_posts", ["hidden"], :name => "index_d_posts_on_hidden"
  add_index "d_posts", ["ip"], :name => "index_d_posts_on_ip"
  add_index "d_posts", ["thread_id"], :name => "index_d_posts_on_thread_id"

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

  add_index "d_threads", ["_id"], :name => "index_d_threads_on__id", :unique => true
  add_index "d_threads", ["author_id"], :name => "index_d_threads_on_author_id"
  add_index "d_threads", ["hidden"], :name => "index_d_threads_on_hidden"
  add_index "d_threads", ["ip"], :name => "index_d_threads_on_ip"

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

  add_index "s_posts", ["_id"], :name => "index_s_posts_on__id", :unique => true
  add_index "s_posts", ["author_id"], :name => "index_s_posts_on_author_id"
  add_index "s_posts", ["hidden"], :name => "index_s_posts_on_hidden"
  add_index "s_posts", ["ip"], :name => "index_s_posts_on_ip"
  add_index "s_posts", ["thread_id"], :name => "index_s_posts_on_thread_id"

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

  add_index "s_threads", ["_id"], :name => "index_s_threads_on__id", :unique => true
  add_index "s_threads", ["author_id"], :name => "index_s_threads_on_author_id"
  add_index "s_threads", ["hidden"], :name => "index_s_threads_on_hidden"
  add_index "s_threads", ["ip"], :name => "index_s_threads_on_ip"

end
