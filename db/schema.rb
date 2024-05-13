# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_02_093113) do
  create_table "animes", force: :cascade do |t|
    t.string "name"
    t.string "original_name"
    t.string "description"
    t.binary "poster"
    t.date "release_date"
    t.string "content_type"
    t.integer "total_episodes"
    t.string "studio"
    t.string "director"
    t.binary "logo"
    t.binary "horizontal_poster"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary "background_poster"
    t.string "release_status"
    t.integer "released_episodes"
    t.binary "age_rating"
    t.string "trailer_link"
  end

  create_table "animes_genres", id: false, force: :cascade do |t|
    t.integer "anime_id"
    t.integer "genre_id"
    t.index ["anime_id"], name: "index_animes_genres_on_anime_id"
    t.index ["genre_id"], name: "index_animes_genres_on_genre_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
