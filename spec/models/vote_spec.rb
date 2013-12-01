require 'spec_helper'

describe Vote do
  let(:vote) { FactoryGirl.build(:vote) }

  it "should exist" do
    expect(vote).to_not be_nil
  end

  it "should belong to a User" do
    expect(vote.user).to be_an_instance_of(User)
  end

  it "should belong to a WineApp" do
    expect(vote.wine_app).to be_an_instance_of(WineApp)
  end

  it "should have a value between 1-5" do
    expect( (1..5).include? vote.value ).to be_true
  end

  it "should error on a non-integer vote value" do
    bad_vote = Vote.create(value: "steve")
    expect(bad_vote.errors.count).to be > 0
  end

  it "should error on a vote value outside the valid range" do
    bad_vote = Vote.create(value: 99)
    expect(bad_vote.errors.empty?).to be_false
  end

  it "should have a specific error when value is outside the valid range" do
    bad_vote = Vote.create(value: 99) 
    expect(bad_vote.errors[:value][0]).to eq "vote must be between 1-5"
  end
end
