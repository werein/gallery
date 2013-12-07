module Gallery
  class Image < ActiveRecord::Base
    include Gallery::Engine.routes.url_helpers
    validates :image, :exposition, presence: :true

    translates :title, :description
    include Core::Concerns::Localizable

    belongs_to :exposition

    mount_uploader :image, Uploadable::Image
    store_in_background :image

    paginates_per 12

    scope :uploaded, -> { where.not(image: nil) }

    def to_jqfu
      { url: image.url,
        thumbnail_url: image_tmp? ? "/uploads/tmp/#{image_tmp}" : image.url,
        name: image.filename,
        type: "image/#{image.file.extension}",
        size: image.size,
        delete_url: exposition_image_path(exposition, id),
        delete_type: 'DELETE' }
    end

    def to_jqfu_response
      { files: [ self.to_jqfu ] }.to_json
    end
  end
end