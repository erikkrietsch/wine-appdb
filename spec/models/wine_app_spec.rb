require 'spec_helper'

describe WineApp do
  let(:wineapp) { FactoryGirl.build(:wine_app) }
  it "should exist" do
    expect(wineapp).to_not be_nil
  end
  it "should have a name" do
    expect(wineapp.name).to_not be_nil
  end
  it "should have a description" do
    expect(wineapp.description).to_not be_nil
  end
end
