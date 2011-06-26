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

ActiveRecord::Schema.define(:version => 20110626055010) do

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.string   "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "topic"
  end

  create_table "user_rooms", :force => true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "phone"
    t.string   "email"
    t.string   "password"
    t.string   "handle"
    t.string   "type"
    t.integer  "age"
    t.string   "gender"
    t.string   "location"
    t.datetime "last_message_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "whispers", :force => true do |t|
    t.string   "contents"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
