require 'spec_helper'

describe WineVersion do
  let(:wine_version) { WineVersion.new }
  it "should derive from BugzillaBase" do
    expect(wine_version).to be_a BugzillaBase
  end

  it "should return 5 results with a call to 'recent'" do
    expect(WineVersion.recent.count).to eq 5
  end

  it "should return results from 'recent' in descending order" do
    expect(WineVersion.recent.first.id).to be > WineVersion.recent.last.id
  end

end
