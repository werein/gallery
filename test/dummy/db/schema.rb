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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140403203108) do

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "dummy_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gallery_exposition_translations", force: true do |t|
    t.integer  "gallery_exposition_id"
    t.string   "locale",                null: false
    t.string   "slug"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gallery_exposition_translations", ["gallery_exposition_id"], name: "index_gallery_exposition_translations_on_gallery_exposition_id"
  add_index "gallery_exposition_translations", ["locale"], name: "index_gallery_exposition_translations_on_locale"

  create_table "gallery_expositions", force: true do |t|
    t.string   "cover"
    t.string   "cover_tmp"
    t.boolean  "active"
    t.string   "ancestry"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gallery_expositions", ["ancestry"], name: "index_gallery_expositions_on_ancestry"

  create_table "gallery_image_translations", force: true do |t|
    t.integer  "gallery_image_id"
    t.string   "locale",           null: false
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gallery_image_translations", ["gallery_image_id"], name: "index_gallery_image_translations_on_gallery_image_id"
  add_index "gallery_image_translations", ["locale"], name: "index_gallery_image_translations_on_locale"

  create_table "gallery_images", force: true do |t|
    t.integer  "exposition_id"
    t.string   "image"
    t.string   "image_tmp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gallery_images", ["exposition_id"], name: "index_gallery_images_on_exposition_id"

  create_table "gallery_video_translations", force: true do |t|
    t.integer  "gallery_video_id"
    t.string   "locale",           null: false
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gallery_video_translations", ["gallery_video_id"], name: "index_gallery_video_translations_on_gallery_video_id"
  add_index "gallery_video_translations", ["locale"], name: "index_gallery_video_translations_on_locale"

  create_table "gallery_videos", force: true do |t|
    t.integer  "exposition_id"
    t.string   "thumb"
    t.string   "thumb_tmp"
    t.string   "video"
    t.string   "video_tmp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gallery_videos", ["exposition_id"], name: "index_gallery_videos_on_exposition_id"

end
