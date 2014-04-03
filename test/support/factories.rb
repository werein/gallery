include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :exposition, class: Gallery::Exposition do
    cover { fixture_file_upload('test/data/mm.jpg') }
    translations {[ association(:exposition_translation)]}
  end

  factory :exposition_translation, class: Gallery::Exposition::Translation do
    title 'Marilyn Monroe'
    sequence(:slug) {|n| "marilyn-monroe-#{n}" }
    locale 'en'
    description 'MM'
  end

  factory :exposition_cs_translation, class: Gallery::Exposition::Translation do
    title 'Marilyn Monroe'
    sequence(:slug) {|n| "marilyn-monroe-#{n}" }
    locale 'cs'
    description 'MM'
  end

  factory :invalid_exposition, parent: :exposition do 
    translations nil
  end

  factory :image, class: Gallery::Image do 
    image { fixture_file_upload('test/data/mm.jpg') }
    exposition
  end

  factory :image_translation, class: Gallery::Image::Translation do
    title 'Marilyn Monroe'
    locale 'en'
  end

  factory :invalid_image, parent: :image do 
    image { fixture_file_upload('test/data/what.mp4') }
    exposition
  end

  factory :video, class: Gallery::Video do 
    video { fixture_file_upload('test/data/what.mp4') }
    exposition
  end

  factory :video_translation, class: Gallery::Video::Translation do
    title 'Marilyn Monroe'
    locale 'en'
  end

  factory :invalid_video, parent: :video do 
    video { fixture_file_upload('test/data/mm.jpg') }
    exposition
  end
 end