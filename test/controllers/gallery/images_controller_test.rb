require 'test_helper'

module Gallery
  describe ImagesController do 
    let(:image_attr)   { attributes_for(:image) }
    let(:invalid_attr) { attributes_for(:invalid_image) }
    let(:current_user) { mock 'user' }

    before do
      can Gallery::Image
      current_user.stubs(:manage?).returns(true)
      current_user.stubs(:xeditable?).returns(true)
      @image = create(:image)
    end

    it "should create image w valid attributes" do
      # Multiple file upload
      image_attr[:image] = [image_attr[:image]]

      assert_difference('Gallery::Image.count') do
        post :create, use_route: :gallery_engine, image: image_attr, exposition_id: 1
      end
      assigns(:image).errors.full_messages.must_be :empty?
      assert_response :success
      assert_equal 'Image was successfully created.', flash[:notice]
    end

    it "shouldn't create post w invalid attributes" do
      # Multiple file upload
      invalid_attr[:image] = [invalid_attr[:image]]

      assert_no_difference('Gallery::Image.count') do
        post :create, use_route: :gallery_engine, image: invalid_attr, exposition_id: 1
      end
      assigns(:image).errors.full_messages.wont_be :empty?
      assert_response 400
    end

    it "should get edit" do 
      get :edit, use_route: :gallery_engine, id: @image
      assigns(:image).wont_be_nil
      assigns(:image).must_equal @image
      assert_response :success
      assert_template :edit
    end

    it "should update image w valid attributes" do
      patch :update, use_route: :gallery_engine, id: @image, image: image_attr
      assigns(:image).errors.full_messages.must_be :empty?
      assert_response :redirect
      assert_redirected_to exposition_path(assigns(:image).exposition)
      assert_equal 'Image was successfully updated.', flash[:notice]
    end

    it "shouldn't update image w invalid attributes" do
      patch :update, use_route: :gallery_engine, id: @image, image: { translations_attributes: [ attributes_for(:image_translation) ] }
      assigns(:image).errors.full_messages.wont_be :empty?
      assigns(:image).must_equal @image
      assert_response :success
      assert_template :edit
    end

    it "should destroy image" do 
      assert_difference('Gallery::Image.count', -1) do
        xhr :delete, :destroy, use_route: :gallery_engine, id: @image
      end
      assert_response :success
      assert_equal 'Image was successfully deleted.', flash[:notice]
    end
  end
end