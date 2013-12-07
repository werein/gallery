require 'test_helper'

module Gallery
  describe VideosController do 
    let(:video_attr)   { attributes_for(:video) }
    let(:invalid_attr) { attributes_for(:invalid_video) }
    let(:current_user) { mock 'user' }

    before do
      can Gallery::Video
      current_user.stubs(:manage?).returns(true)
      current_user.stubs(:xeditable?).returns(true)
      @video = create(:video)
    end

    it "should create video w valid attributes" do
      # Multiple file upload
      video_attr[:video] = [video_attr[:video]]

      assert_difference('Gallery::Video.count') do
        post :create, use_route: :gallery_engine, video: video_attr, exposition_id: 1
      end
      assigns(:video).errors.full_messages.must_be :empty?
      assert_response :success
      assert_equal 'Video was successfully created.', flash[:notice]
    end

    it "shouldn't create post w invalid attributes" do
      # Multiple file upload
      invalid_attr[:video] = [invalid_attr[:video]]

      assert_no_difference('Gallery::Video.count') do
        post :create, use_route: :gallery_engine, video: invalid_attr, exposition_id: 1
      end
      assigns(:video).errors.full_messages.wont_be :empty?
      assert_response 400
    end
    
    it "should get edit" do 
      get :edit, use_route: :gallery_engine, id: @video
      assigns(:video).wont_be_nil
      assigns(:video).must_equal @video
      assert_response :success
      assert_template :edit
    end

    it "should update video w valid attributes" do
      patch :update, use_route: :gallery_engine, id: @video, video: video_attr
      assigns(:video).errors.full_messages.must_be :empty?
      assert_response :redirect
      assert_redirected_to exposition_path(assigns(:video).exposition)
      assert_equal 'Video was successfully updated.', flash[:notice]
    end

    it "shouldn't update video w invalid attributes" do
      patch :update, use_route: :gallery_engine, id: @video, video: { translations_attributes: [ attributes_for(:video_translation) ] }
      assigns(:video).errors.full_messages.wont_be :empty?
      assigns(:video).must_equal @video
      assert_response :success
      assert_template :edit
    end

    it "should destroy video" do 
      assert_difference('Gallery::Video.count', -1) do
        xhr :delete, :destroy, use_route: :gallery_engine, id: @video
      end
      assert_response :success
      assert_equal 'Video was successfully deleted.', flash[:notice]
    end
  end
end