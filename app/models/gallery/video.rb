module Gallery
  class Video < ActiveRecord::Base
    include Gallery::Engine.routes.url_helpers
    validates :video, :exposition, presence: true
    translates :title, :description
    accepts_nested_attributes_for :translations, allow_destroy: true

    belongs_to :exposition

    mount_uploader :thumb, Uppr::Image
    store_in_background :thumb
    mount_uploader :video, Uppr::Video
    store_in_background :video

    paginates_per 2

    scope :uploaded, -> { where.not(video: nil) }

    def to_jqfu
      { url: video.url,
        thumbnail_url: video_tmp? ? "/uploads/tmp/#{video_tmp}" : video.url,
        name: video.filename,
        type: "video/#{video.file.extension}",
        size: video.size,
        delete_url: exposition_video_path(exposition, id),
        delete_type: 'DELETE' }
    end

    def to_jqfu_response
      { files: [ self.to_jqfu ] }.to_json
    end
  end
end