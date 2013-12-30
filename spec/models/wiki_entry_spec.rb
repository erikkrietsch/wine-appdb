require 'spec_helper'

describe WikiEntry do
  let(:wikientry) { FactoryGirl.build(:wiki_entry) }
  it "should have content" do
    
    expect(wikientry.content).to_not be_nil
  end
end
