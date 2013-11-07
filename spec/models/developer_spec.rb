require 'spec_helper'

describe Developer do
  let(:developer) { FactoryGirl.build(:developer) }
  it "should exist" do
    expect(developer).to_not be_nil
  end
  it "should have a name" do
    expect(developer.name).to_not be_nil
  end
  it "should have a description" do
    expect(developer.description).to_not be_nil
  end
  it "should respond to url" do
    expect{ developer.url }.to_not raise_error
  end
  it "should respond to logo" do
    expect{ developer.logo }.to_not raise_error
  end
end
