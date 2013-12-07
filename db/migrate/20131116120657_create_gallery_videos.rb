class CreateGalleryVideos < ActiveRecord::Migration
  def change
    create_table :gallery_videos do |t|
      t.references :exposition, index: true
      t.string :thumb
      t.string :thumb_tmp      
      t.string :video
      t.string :video_tmp
      t.timestamps
    end

    create_table :gallery_video_translations do |t|
      t.references :gallery_video, index: true
      t.string  :locale, null: false
      t.string  :title
      t.text  :description
      t.timestamps
    end

    add_index :gallery_video_translations, :locale
  end
end