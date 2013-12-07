require 'test_helper'
 
module Gallery
  class StubbedController < ApplicationController
    def test_ability
      @ability = current_ability
      render nothing: true
    end
  end
   
  describe StubbedController do 
    before do
      user = mock('user')
      user.stubs(:has_role?).returns(false)
      @controller.stubs(:current_user).returns(user)
    end

    it 'should have ability defined from current module' do
      get :test_ability, use_route: :gallery_engine
      assert_response :success
      assigns(:ability).must_be_instance_of(Gallery::Ability)
    end
  end
end