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

ActiveRecord::Schema.define(:version => 92) do

  create_table "admin_log_entries", :force => true do |t|
    t.integer  "user_id"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bans", :force => true do |t|
    t.text     "reason"
    t.integer  "level"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boards", :force => true do |t|
    t.string   "alias"
    t.string   "name"
    t.integer  "level"
    t.integer  "total_threads"
    t.text     "settings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boards", ["alias"], :name => "index_boards_on_alias", :unique => true

  create_table "ids", :force => true do |t|
    t.text     "ids"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ips", :force => true do |t|
    t.string   "ip"
    t.integer  "ban_id"
    t.datetime "last_post"
    t.datetime "last_thread"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ips", ["ip"], :name => "index_ips_on_ip", :unique => true

  create_table "motds", :force => true do |t|
    t.integer  "user_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.text     "message"
    t.string   "board"
    t.integer  "rid"
    t.integer  "user_id"
    t.integer  "ip_id"
    t.integer  "r_thread_id"
    t.integer  "thread_id"
    t.boolean  "hidden",      :default => false
    t.boolean  "sage",        :default => false
    t.string   "file_name"
    t.string   "file_type"
    t.integer  "file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["board"], :name => "index_posts_on_board"
  add_index "posts", ["ip_id"], :name => "index_posts_on_ip_id"
  add_index "posts", ["r_thread_id"], :name => "index_posts_on_r_thread_id"
  add_index "posts", ["rid", "board"], :name => "index_posts_on_rid_and_board", :unique => true
  add_index "posts", ["thread_id"], :name => "index_posts_on_thread_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "r_files", :force => true do |t|
    t.string   "hash"
    t.string   "board"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "r_files", ["hash", "board"], :name => "index_r_files_on_hash_and_board", :unique => true

  create_table "r_threads", :force => true do |t|
    t.text     "message"
    t.string   "title"
    t.string   "board"
    t.integer  "rid"
    t.integer  "replies_count", :default => 0
    t.integer  "user_id"
    t.integer  "ip_id"
    t.boolean  "hidden",        :default => false
    t.boolean  "sticky",        :default => false
    t.datetime "bump"
    t.string   "file_name"
    t.string   "file_type"
    t.integer  "file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "r_threads", ["board"], :name => "index_r_threads_on_board"
  add_index "r_threads", ["ip_id"], :name => "index_r_threads_on_ip_id"
  add_index "r_threads", ["rid", "board"], :name => "index_r_threads_on_rid_and_board", :unique => true
  add_index "r_threads", ["user_id"], :name => "index_r_threads_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "key"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["key"], :name => "index_sessions_on_key", :unique => true

  create_table "users", :force => true do |t|
    t.text     "settings"
    t.text     "seen"
    t.string   "password"
    t.integer  "ban_id"
    t.integer  "level",      :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["password"], :name => "index_users_on_password", :unique => true

end
