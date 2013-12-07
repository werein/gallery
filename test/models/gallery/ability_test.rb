require "test_helper"

module Gallery
  describe Ability do
    describe 'Anuathorized access' do 
      let(:ability) { Ability.new(nil) }

      describe 'Expositions' do 
        it "can index expositions"            do ability.can?(:index, :expositions).must_equal true end
        it "can show expositions"             do ability.can?(:show, Exposition.new).must_equal true end
        it "cannot edit expositions"          do ability.cannot?(:edit, Exposition.new).must_equal true end
        it "cannot update expositions"        do ability.cannot?(:update, Exposition.new).must_equal true end
        it "cannot delete expositions"        do ability.cannot?(:delete, Exposition.new).must_equal true end
      end

      describe 'Images' do 
        it "can show images"             do ability.can?(:show, Image.new).must_equal true end
        it "cannot edit images"          do ability.cannot?(:edit, Image.new).must_equal true end
        it "cannot update images"        do ability.cannot?(:update, Image.new).must_equal true end
        it "cannot delete images"        do ability.cannot?(:delete, Image.new).must_equal true end
      end

      describe 'Videos' do 
        it "can show videos"             do ability.can?(:show, Video.new).must_equal true end
        it "cannot edit videos"          do ability.cannot?(:edit, Video.new).must_equal true end
        it "cannot update videos"        do ability.cannot?(:update, Video.new).must_equal true end
        it "cannot delete videos"        do ability.cannot?(:delete, Video.new).must_equal true end
      end
    end

    describe 'User access' do 
      let(:user)    { user_ability(:user) }
      let(:ability) { Ability.new(user) }
      let(:current_user) { mock 'user' }

      describe 'Expositions' do 
        it "can index expositions"            do ability.can?(:index, :expositions).must_equal true end
        it "can show expositions"             do ability.can?(:show, Exposition.new).must_equal true end
        it "cannot edit expositions"          do ability.cannot?(:edit, Exposition.new).must_equal true end
        it "cannot update expositions"        do ability.cannot?(:update, Exposition.new).must_equal true end
        it "cannot delete expositions"        do ability.cannot?(:delete, Exposition.new).must_equal true end
      end

      describe 'Images' do 
        it "can show images"             do ability.can?(:show, Image.new).must_equal true end
        it "cannot edit images"          do ability.cannot?(:edit, Image.new).must_equal true end
        it "cannot update images"        do ability.cannot?(:update, Image.new).must_equal true end
        it "cannot delete images"        do ability.cannot?(:delete, Image.new).must_equal true end
      end

      describe 'Videos' do 
        it "can show videos"             do ability.can?(:show, Video.new).must_equal true end
        it "cannot edit videos"          do ability.cannot?(:edit, Video.new).must_equal true end
        it "cannot update videos"        do ability.cannot?(:update, Video.new).must_equal true end
        it "cannot delete videos"        do ability.cannot?(:delete, Video.new).must_equal true end
      end
    end

    describe 'Admin access' do 
      let(:user)    { user_ability(:admin) }
      let(:ability) { Ability.new(user) }
      let(:current_user) { mock 'user' }

      describe 'Expositions' do 
        it "can index expositions"            do ability.can?(:index, :expositions).must_equal true end
        it "can show expositions"             do ability.can?(:show, Exposition.new).must_equal true end
        it "can edit expositions"             do ability.can?(:edit, Exposition.new).must_equal true end
        it "can update expositions"           do ability.can?(:update, Exposition.new).must_equal true end
        it "can delete expositions"           do ability.can?(:delete, Exposition.new).must_equal true end
      end

      describe 'Images' do 
        it "can show images"             do ability.can?(:show, Image.new).must_equal true end
        it "can edit images"             do ability.can?(:edit, Image.new).must_equal true end
        it "can update images"           do ability.can?(:update, Image.new).must_equal true end
        it "can delete images"           do ability.can?(:delete, Image.new).must_equal true end
      end
      
      describe 'Videos' do 
        it "can show videos"             do ability.can?(:show, Video.new).must_equal true end
        it "can edit videos"             do ability.can?(:edit, Video.new).must_equal true end
        it "can update videos"           do ability.can?(:update, Video.new).must_equal true end
        it "can delete videos"           do ability.can?(:delete, Video.new).must_equal true end
      end
    end
  end
end