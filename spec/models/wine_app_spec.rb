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
  it "should have a logo" do
    expect(wineapp.logo).to_not be_nil 
  end
  it "should have a slug property" do
    expect(wineapp.slug).to_not be_nil
  end
  it "should respond to to_param with the slug property" do
    expect(wineapp.to_param).to eq wineapp.slug
  end
end
