# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_07_200556) do

  create_table "user_votes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "video_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_votes_on_user_id"
    t.index ["video_id"], name: "index_user_votes_on_video_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid"
    t.string "current_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uuid"], name: "index_users_on_uuid"
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "duration"
    t.string "main_poster"
    t.string "gif_preview"
    t.integer "external_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
