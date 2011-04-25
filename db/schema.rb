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

  create_table "bo_posts", :force => true do |t|
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

  add_index "bo_posts", ["_id"], :name => "index_bo_posts_on__id", :unique => true
  add_index "bo_posts", ["author_id"], :name => "index_bo_posts_on_author_id"
  add_index "bo_posts", ["hidden"], :name => "index_bo_posts_on_hidden"
  add_index "bo_posts", ["ip"], :name => "index_bo_posts_on_ip"
  add_index "bo_posts", ["thread_id"], :name => "index_bo_posts_on_thread_id"

  create_table "bo_threads", :force => true do |t|
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

  add_index "bo_threads", ["_id"], :name => "index_bo_threads_on__id", :unique => true
  add_index "bo_threads", ["author_id"], :name => "index_bo_threads_on_author_id"
  add_index "bo_threads", ["hidden"], :name => "index_bo_threads_on_hidden"
  add_index "bo_threads", ["ip"], :name => "index_bo_threads_on_ip"

  create_table "boards", :force => true do |t|
    t.string   "alias"
    t.string   "name"
    t.string   "description"
    t.integer  "level"
    t.text     "settings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boards", ["alias"], :name => "index_boards_on_alias", :unique => true

  create_table "cr_posts", :force => true do |t|
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

  add_index "cr_posts", ["_id"], :name => "index_cr_posts_on__id", :unique => true
  add_index "cr_posts", ["author_id"], :name => "index_cr_posts_on_author_id"
  add_index "cr_posts", ["hidden"], :name => "index_cr_posts_on_hidden"
  add_index "cr_posts", ["ip"], :name => "index_cr_posts_on_ip"
  add_index "cr_posts", ["thread_id"], :name => "index_cr_posts_on_thread_id"

  create_table "cr_threads", :force => true do |t|
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

  add_index "cr_threads", ["_id"], :name => "index_cr_threads_on__id", :unique => true
  add_index "cr_threads", ["author_id"], :name => "index_cr_threads_on_author_id"
  add_index "cr_threads", ["hidden"], :name => "index_cr_threads_on_hidden"
  add_index "cr_threads", ["ip"], :name => "index_cr_threads_on_ip"

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
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motds", :force => true do |t|
    t.integer  "user_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mu_posts", :force => true do |t|
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

  add_index "mu_posts", ["_id"], :name => "index_mu_posts_on__id", :unique => true
  add_index "mu_posts", ["author_id"], :name => "index_mu_posts_on_author_id"
  add_index "mu_posts", ["hidden"], :name => "index_mu_posts_on_hidden"
  add_index "mu_posts", ["ip"], :name => "index_mu_posts_on_ip"
  add_index "mu_posts", ["thread_id"], :name => "index_mu_posts_on_thread_id"

  create_table "mu_threads", :force => true do |t|
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

  add_index "mu_threads", ["_id"], :name => "index_mu_threads_on__id", :unique => true
  add_index "mu_threads", ["author_id"], :name => "index_mu_threads_on_author_id"
  add_index "mu_threads", ["hidden"], :name => "index_mu_threads_on_hidden"
  add_index "mu_threads", ["ip"], :name => "index_mu_threads_on_ip"

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

  create_table "tv_posts", :force => true do |t|
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

  add_index "tv_posts", ["_id"], :name => "index_tv_posts_on__id", :unique => true
  add_index "tv_posts", ["author_id"], :name => "index_tv_posts_on_author_id"
  add_index "tv_posts", ["hidden"], :name => "index_tv_posts_on_hidden"
  add_index "tv_posts", ["ip"], :name => "index_tv_posts_on_ip"
  add_index "tv_posts", ["thread_id"], :name => "index_tv_posts_on_thread_id"

  create_table "tv_threads", :force => true do |t|
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

  add_index "tv_threads", ["_id"], :name => "index_tv_threads_on__id", :unique => true
  add_index "tv_threads", ["author_id"], :name => "index_tv_threads_on_author_id"
  add_index "tv_threads", ["hidden"], :name => "index_tv_threads_on_hidden"
  add_index "tv_threads", ["ip"], :name => "index_tv_threads_on_ip"

  create_table "vg_posts", :force => true do |t|
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

  add_index "vg_posts", ["_id"], :name => "index_vg_posts_on__id", :unique => true
  add_index "vg_posts", ["author_id"], :name => "index_vg_posts_on_author_id"
  add_index "vg_posts", ["hidden"], :name => "index_vg_posts_on_hidden"
  add_index "vg_posts", ["ip"], :name => "index_vg_posts_on_ip"
  add_index "vg_posts", ["thread_id"], :name => "index_vg_posts_on_thread_id"

  create_table "vg_threads", :force => true do |t|
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

  add_index "vg_threads", ["_id"], :name => "index_vg_threads_on__id", :unique => true
  add_index "vg_threads", ["author_id"], :name => "index_vg_threads_on_author_id"
  add_index "vg_threads", ["hidden"], :name => "index_vg_threads_on_hidden"
  add_index "vg_threads", ["ip"], :name => "index_vg_threads_on_ip"

  create_table "zen_posts", :force => true do |t|
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

  add_index "zen_posts", ["_id"], :name => "index_zen_posts_on__id", :unique => true
  add_index "zen_posts", ["author_id"], :name => "index_zen_posts_on_author_id"
  add_index "zen_posts", ["hidden"], :name => "index_zen_posts_on_hidden"
  add_index "zen_posts", ["ip"], :name => "index_zen_posts_on_ip"
  add_index "zen_posts", ["thread_id"], :name => "index_zen_posts_on_thread_id"

  create_table "zen_threads", :force => true do |t|
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

  add_index "zen_threads", ["_id"], :name => "index_zen_threads_on__id", :unique => true
  add_index "zen_threads", ["author_id"], :name => "index_zen_threads_on_author_id"
  add_index "zen_threads", ["hidden"], :name => "index_zen_threads_on_hidden"
  add_index "zen_threads", ["ip"], :name => "index_zen_threads_on_ip"

end
