module Gallery
  class Exposition < ActiveRecord::Base
    translates :slug, :title, :description
    validates :translations, presence: true
    include Core::Concerns::Localizable

    has_many :images, dependent: :destroy
    accepts_nested_attributes_for :images, allow_destroy: true

    has_many :videos, dependent: :destroy
    accepts_nested_attributes_for :videos, allow_destroy: true

    has_ancestry

    mount_uploader :cover, Uploadable::Image
    store_in_background :cover

    scope :latest, -> { order('gallery_expositions.created_at DESC') }
    scope :themself, ->(o) { where.not(id: o.id) }
    scope :localized, ->{ with_translations(I18n.locale) }

    # Rewrite default path with +id+ and +translation.name+
    # This is used as default in +url_for+
    def to_param
      "#{id}-#{translation.slug}".parameterize
    end

    def parent_enum
      Exposition.themself(self).localized.map { |c| [ c.title, c.id ] }
    end
  end
end