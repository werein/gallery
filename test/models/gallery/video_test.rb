require 'test_helper'

module Gallery
  describe Video do
    let(:video) {build_stubbed(:video)}

    it "default must be valid" do
      video.must_be :valid?
    end

    it "must generate hash to response" do 
      video.to_jqfu.has_key?(:url).must_equal true
      video.to_jqfu.has_key?(:thumbnail_url).must_equal true
      video.to_jqfu.has_key?(:name).must_equal true
      video.to_jqfu.has_key?(:type).must_equal true
      video.to_jqfu.has_key?(:size).must_equal true
      video.to_jqfu.has_key?(:delete_url).must_equal true
      video.to_jqfu.has_key?(:delete_type).must_equal true
    end

    it "must generate hash with files" do 
      video.to_jqfu_response.must_equal "{\"files\":[#{video.to_jqfu.to_json}]}"
    end

    <<-DOC
      https://github.com/blueimp/jQuery-File-Upload/wiki/JSON-Response

      # Example of result
      { 
        files:
          [
            {
              url: "http://url.to/file/or/page",
              thumbnail_url: "http://url.to/thumnail.jpg ",
              name: "thumb2.jpg",
              type: "image/jpeg",
              size: 46353,
              delete_url: "http://url.to/delete /file/",
              delete_type: "DELETE"
            }
          ]
      }
    DOC
  end
end