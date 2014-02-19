require 'spec_helper'

describe Bug do
  let(:bug) { Bug.new }
  it "should derive from BugzillaBase" do
    expect(bug).to be_a BugzillaBase
  end

  it "should respond to short_desc" do 
    expect(bug).to respond_to :short_desc
  end

  it "should alias 'short_desc' to 'description'" do
    my_bug = Bug.find(1)  
    expect(my_bug.short_desc).to eq my_bug.description
  end
end
