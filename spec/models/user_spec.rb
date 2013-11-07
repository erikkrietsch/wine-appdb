require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }
  it "should exist" do
    expect(user).to_not be_nil
  end
  it "should have a name" do
    expect(user.name).to_not be_nil
  end
  it "should have an email address" do
    expect(user.email).to_not be_nil
  end
  it "should respond to token" do
    expect{ user.token }.to_not raise_error
  end
  it "should have a password" do
    expect(user.password).to_not be_nil
  end
  
end
