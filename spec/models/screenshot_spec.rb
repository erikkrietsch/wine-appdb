require 'spec_helper'

describe Screenshot do
  let(:screenshot) { FactoryGirl.build(:screenshot) }

  it "should produce an error without a title or image" do
    bad_screenshot = Screenshot.create(image: nil, title: nil)
    expect(bad_screenshot.errors[:title].first).to_not be_nil
    expect(bad_screenshot.errors[:image].first).to_not be_nil
  end

  it "should have a working image url" do
  	expect(screenshot.image.url).to_not be_nil
  end


end
