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

ActiveRecord::Schema.define(:version => 20110420143953) do

  create_table "b_posts", :force => true do |t|
    t.text     "message"
    t.string   "title"
    t.string   "ip"
    t.integer  "_id"
    t.integer  "author_id"
    t.integer  "thread_id"
    t.boolean  "hidden"
    t.boolean  "sage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "b_threads", :force => true do |t|
    t.text     "message"
    t.string   "title"
    t.string   "ip"
    t.integer  "_id"
    t.integer  "replies_count"
    t.integer  "author_id"
    t.integer  "board_id"
    t.boolean  "hidden"
    t.boolean  "sticky"
    t.datetime "bump"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boards", :force => true do |t|
    t.string   "alias"
    t.string   "name"
    t.text     "settings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dev_posts", :force => true do |t|
    t.text     "message"
    t.string   "title"
    t.string   "ip"
    t.integer  "_id"
    t.integer  "author_id"
    t.integer  "thread_id"
    t.boolean  "hidden"
    t.boolean  "sage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dev_threads", :force => true do |t|
    t.text     "message"
    t.string   "title"
    t.string   "ip"
    t.integer  "_id"
    t.integer  "replies_count"
    t.integer  "author_id"
    t.integer  "board_id"
    t.boolean  "hidden"
    t.boolean  "sticky"
    t.datetime "bump"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ids", :force => true do |t|
    t.text     "ids"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "one_a", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "one_b", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "two_a", :force => true do |t|
    t.integer  "one_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "two_b", :force => true do |t|
    t.integer  "one_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
