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

ActiveRecord::Schema.define(:version => 20150129222859) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "tags"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "editable",    :default => true
  end

  add_index "categories", ["user_id"], :name => "index_categories_on_user_id"

  create_table "entries", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "summary"
    t.string   "url"
    t.datetime "published_at"
    t.string   "guid"
    t.integer  "feed_id"
    t.boolean  "favorite",     :default => false
    t.boolean  "read",         :default => false
    t.integer  "user_id"
    t.text     "content"
  end

  add_index "entries", ["feed_id"], :name => "index_entries_on_feed_id"

  create_table "feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "etag"
    t.datetime "last_modified"
    t.integer  "user_id"
  end

  add_index "feeds", ["category_id"], :name => "index_feeds_on_category_id"

  create_table "filters", :force => true do |t|
    t.string   "keywords"
    t.boolean  "list_type",  :default => false
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "feed_id"
    t.integer  "user_id"
  end

  add_index "filters", ["feed_id"], :name => "index_filters_on_feed_id"

  create_table "followings", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "followed_id"
  end

  add_index "followings", ["followed_id"], :name => "index_followings_on_followed_id"
  add_index "followings", ["user_id"], :name => "index_followings_on_user_id"

  create_table "notifications", :force => true do |t|
    t.string   "keywords"
    t.integer  "feed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "active",     :default => true
  end

  add_index "notifications", ["feed_id"], :name => "index_notifications_on_feed_id"

  create_table "users", :force => true do |t|
    t.string   "email",                   :default => "",   :null => false
    t.string   "encrypted_password",      :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           :default => 0,    :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "name"
    t.boolean  "notify_new_follower",     :default => true
    t.boolean  "notify_site_updates",     :default => true
    t.boolean  "notify_important_topics", :default => true
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
