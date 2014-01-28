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

  it "should have a quality value between 0-100" do
    expect( (0..100).include? vote.quality_value ).to be_true
  end

  it "should have a difficulty value between 0-100" do
    expect( (0..100).include? vote.difficulty_value ).to be_true
  end

  it "should error on a non-integer vote value" do
    bad_vote = Vote.create(quality_value: "steve", difficulty_value: "meadow")
    expect(bad_vote.errors.count).to be > 0
  end

  it "should error on a vote value outside the valid range" do
    bad_vote = Vote.create(quality_value: 999, difficulty_value: -1000)
    expect(bad_vote.errors.empty?).to be_false
  end

  it "should have a specific error when value is outside the valid range" do
    bad_vote = Vote.create(quality_value: 1000, difficulty_value: -1) 
    expect(bad_vote.errors[:quality_value].first).to match("vote must be between")
    expect(bad_vote.errors[:difficulty_value].first).to match("vote must be between")
  end

  it "should always have an IP address" do
    expect(vote.ip_address).to_not be_nil
  end
end
