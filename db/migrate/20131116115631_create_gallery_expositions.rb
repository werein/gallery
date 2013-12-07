class CreateGalleryExpositions < ActiveRecord::Migration
  def change
    create_table :gallery_expositions do |t|
      t.string :cover
      t.string :cover_tmp
      t.boolean :active
      t.string  :ancestry
      t.integer :position
      t.timestamps
    end

    add_index :gallery_expositions, :ancestry

    create_table :gallery_exposition_translations do |t|
      t.references :gallery_exposition, index: true
      t.string  :locale, null: false
      t.string  :slug
      t.string  :title
      t.text  :description
      t.timestamps
    end

    add_index :gallery_exposition_translations, :locale
  end
end