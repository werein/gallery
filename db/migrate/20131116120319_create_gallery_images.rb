class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.references :exposition, index: true
      t.string :image
      t.string :image_tmp
      t.timestamps
    end

    create_table :gallery_image_translations do |t|
      t.references :gallery_image, index: true
      t.string  :locale, null: false
      t.string  :title
      t.text  :description
      t.timestamps
    end

    add_index :gallery_image_translations, :locale
  end
end
