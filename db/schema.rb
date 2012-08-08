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

ActiveRecord::Schema.define(:version => 20120808001326) do

  create_table "avatars", :force => true do |t|
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "register_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "dossiers", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "state"
  end

  create_table "intern_notifications", :force => true do |t|
    t.date     "date_intern"
    t.string   "who"
    t.text     "description"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "intern_notification_file_file_name"
    t.string   "intern_notification_file_content_type"
    t.integer  "intern_notification_file_file_size"
    t.datetime "intern_notification_file_updated_at"
  end

  create_table "notifications", :force => true do |t|
    t.string   "who"
    t.date     "date_notification"
    t.text     "description"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "notification_file_file_name"
    t.string   "notification_file_content_type"
    t.integer  "notification_file_file_size"
    t.datetime "notification_file_updated_at"
  end

  create_table "registers", :force => true do |t|
    t.text     "who"
    t.date     "date_register"
    t.text     "description"
    t.string   "number_enter"
    t.integer  "time_respond"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "dossier_id"
    t.string   "type_document"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
