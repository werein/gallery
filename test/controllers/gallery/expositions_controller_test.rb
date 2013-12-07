require 'test_helper'

module Gallery
  describe ExpositionsController do 
    let(:exposition_attr) { attributes_for(:exposition, translations_attributes: [ attributes_for(:exposition_translation) ]).except(:translations) }
    let(:invalid_attr) { attributes_for(:invalid_exposition) }
    let(:current_user) {mock 'user'}

    before do
      can Gallery::Exposition
      current_user.stubs(:manage?).returns(true)
      current_user.stubs(:xeditable?).returns(true)
      @exposition = create(:exposition)
    end

    it "should get index" do 
      get :index, use_route: :gallery_engine
      assigns(:expositions).wont_be_nil
      assert_response :success
      assert_template :index
    end

    it "should get new" do 
      get :new, use_route: :gallery_engine
      assigns(:exposition).wont_be_nil
      assert_response :success
      assert_template :new
    end

    it "should create exposition w valid attributes" do 
      assert_difference('Gallery::Exposition.count') do
        post :create, use_route: :gallery_engine, exposition: exposition_attr
      end
      assigns(:exposition).errors.full_messages.must_be :empty?
      assert_response :redirect
      assert_redirected_to exposition_path(assigns(:exposition))
      assert_equal 'Exposition was successfully created.', flash[:notice]
    end

    it "shouldn't create post w invalid attributes" do 
      assert_no_difference('Gallery::Exposition.count') do
        post :create, use_route: :gallery_engine, exposition: invalid_attr
      end
      assigns(:exposition).errors.full_messages.wont_be :empty?
      assert_response :success
      assert_template :new
    end

    it "should show exposition" do 
      get :show, use_route: :gallery_engine, id: @exposition
      assigns(:exposition).wont_be_nil
      assigns(:exposition).must_equal @exposition
      assert_response :success
      assert_template :show
    end

    it "should get edit" do 
      get :edit, use_route: :gallery_engine, id: @exposition
      assigns(:exposition).wont_be_nil
      assigns(:exposition).must_equal @exposition
      assert_response :success
      assert_template :edit
    end

    it "should update exposition w valid attributes" do
      patch :update, use_route: :gallery_engine, id: @exposition, exposition: { translations_attributes: [ attributes_for(:exposition_cs_translation) ] }
      assigns(:exposition).errors.full_messages.must_be :empty?
      assert_response :redirect
      assert_redirected_to exposition_path(assigns(:exposition))
      assert_equal 'Exposition was successfully updated.', flash[:notice]
    end

    it "shouldn't update exposition w invalid attributes" do
      patch :update, use_route: :gallery_engine, id: @exposition, exposition: { translations_attributes: [ attributes_for(:exposition_translation) ] }
      assigns(:exposition).errors.full_messages.wont_be :empty?
      assigns(:exposition).must_equal @exposition
      assert_response :success
      assert_template :edit
    end

    it "should destroy exposition" do 
      assert_difference('Gallery::Exposition.count', -1) do
        delete :destroy, use_route: :gallery_engine, id: @exposition
      end
      assert_response :redirect
      assert_redirected_to expositions_path
      assert_equal 'Exposition was successfully deleted.', flash[:notice]
    end
  end
end