# desc "Explaining what the task does"
# task :gallery do
#   # Task goes here
# end

namespace :gallery do
  namespace :exposition do 
    desc "Regenerate all images on expositions"
    task recreate_versions: :environment do 
      Gallery::Exposition.all.each do |i|
        if i.cover? and i.cover.file.exists?
          i.process_cover_upload = true
          i.cover.recreate_versions!
        end
      end
    end
  end

  namespace :image do 
    desc "Regenerate all images on images"
    task recreate_versions: :environment do 
      Gallery::Image.all.each do |i|
        if i.image? and i.image.file.exists?
          i.process_image_upload = true
          i.image.recreate_versions!
        end
      end
    end
  end

  namespace :video do 
    desc "Regenerate all videos and thumbs on videos"
    task recreate_versions: :environment do 
      Gallery::Video.all.each do |i|
        if i.video? and i.video.file.exists?
          i.process_video_upload = true
          i.video.recreate_versions!
        end
        if i.thumb? and i.thumb.file.exists?
          i.process_thumb_upload = true
          i.thumb.recreate_versions!
        end
      end
    end
  end
end