module Gallery
  class Exposition::Translation < Globalize::ActiveRecord::Translation 
    extend Enumerize
    include Core::Concerns::Slugged
    validates :title, length: { maximum: 255 }, presence: true
    validates :locale, presence: true, uniqueness: { scope: :gallery_exposition_id }
    
    enumerize :locale, in: I18n.available_locales

    def to_s
      title
    end
  end
end