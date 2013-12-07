module Gallery
  class Video < ActiveRecord::Base
    include Gallery::Engine.routes.url_helpers
    validates :video, :exposition, presence: true
    translates :title, :description
    include Core::Concerns::Localizable

    belongs_to :exposition

    mount_uploader :thumb, Uploadable::Image
    store_in_background :thumb
    mount_uploader :video, Uploadable::Video
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