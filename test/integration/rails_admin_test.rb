require 'test_helper'

describe "Rails Admin Feature" do
  let(:current_user)  { create(:user) }
  before              { integration_login }
  after               { Warden.test_reset! }

  it "must have access to create new exposition" do 
    visit rails_admin.new_path(model_name: 'gallery~exposition')
    within '#new_gallery_exposition' do 
      page.has_content?('Active').must_equal true
      page.has_content?('Cover').must_equal true
      page.has_content?('Parent').must_equal true
      page.has_content?('Translations').must_equal true
    end
  end

  it "must have access to create new image" do 
    visit rails_admin.new_path(model_name: 'gallery~image')
    within '#new_gallery_image' do
      page.has_content?('Image').must_equal true
      page.has_content?('Exposition').must_equal true
      page.has_content?('Translations').must_equal true
    end
  end

  it "must have access to create new video" do 
    visit rails_admin.new_path(model_name: 'gallery~video')
    within '#new_gallery_video' do 
      page.has_content?('Video').must_equal true
      page.has_content?('Thumb').must_equal true
      page.has_content?('Exposition').must_equal true
      page.has_content?('Translations').must_equal true
    end
  end
end