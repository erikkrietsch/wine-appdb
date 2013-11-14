require 'spec_helper'

describe "developers/index" do
  before(:each) do
    assign(:developers, [
      stub_model(Developer),
      stub_model(Developer)
    ])
  end

  it "renders a list of developers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
