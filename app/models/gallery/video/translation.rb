module Gallery
  class Video::Translation < Globalize::ActiveRecord::Translation 
    extend Enumerize
    validates :locale, uniqueness: { scope: :gallery_video_id }
    enumerize :locale, in: I18n.available_locales
  end
end