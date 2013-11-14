require 'spec_helper'

describe "developers/show" do
  before(:each) do
    @developer = assign(:developer, stub_model(Developer))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
