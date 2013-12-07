# desc "Explaining what the task does"
# task :gallery do
#   # Task goes here
# end

namespace :gallery do
  namespace :exposition do 
    desc "Regenerate all images on expositions"
    task recreate_versions: :environment do 
      Gallery::Exposition.all.each do |i|
        i.process_image_upload = true
        i.image.recreate_versions!
      end
    end
  end

  namespace :image do 
    desc "Regenerate all images on images"
    task recreate_versions: :environment do 
      Gallery::Image.all.each do |i|
        i.process_image_upload = true
        i.image.recreate_versions!
      end
    end
  end

  namespace :video do 
    desc "Regenerate all videos and thumbs on videos"
    task recreate_versions: :environment do 
      Gallery::Video.all.each do |v|
        i.process_video_upload = true
        i.process_thumb_upload = true
        v.video.recreate_versions!
        v.thumb.recreate_versions!
      end
    end
  end
end