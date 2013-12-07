require 'test_helper'

module Gallery
  describe Exposition do
    let(:exposition) {build_stubbed(:exposition)}

    it "default must be valid" do
      exposition.must_be :valid?
    end

    it "must have title as default to_s result" do 
      "#{exposition.translation}".must_equal exposition.translation.title
    end

    it "must have at least one translation" do
      build_stubbed(:exposition, translations: []).wont_be :valid?
    end

    it "must generate enum" do 
      first, second = create(:exposition), create(:exposition)
      create(:exposition).parent_enum.must_include [first.title, first.id]
    end

    it "must generate url param from slug" do 
      exposition.to_param.must_include exposition.translation.slug.parameterize
    end
  end
end