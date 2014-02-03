require 'test_helper'

module Gallery
  describe ImageCell do
    it "should show posts" do
      post = create(:image)
      post.title = 'Marilyn Monroe'
      post.save
      render_cell('gallery/image', :show).must_include 'Marilyn Monroe'
    end
  end
end