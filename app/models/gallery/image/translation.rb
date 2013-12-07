module Gallery
  class Image::Translation < Globalize::ActiveRecord::Translation 
    extend Enumerize
    validates :title, length: { maximum: 255 }
    validates :locale, presence: true, uniqueness: { scope: :gallery_image_id }
    enumerize :locale, in: I18n.available_locales

    def to_s
      title
    end
  end
end