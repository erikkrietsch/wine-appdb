require 'spec_helper'


describe Logo do
  let(:logo) { FactoryGirl.build(:logo) }
  it "can save a new Logo" do
    new_logo = Logo.new
    new_logo.image_file_name = "butts.gif"
    new_logo.image_content_type = "image/gif"
    # new_logo.image_file_size = 1024
    expect(new_logo.save).to eq true
  end
end
