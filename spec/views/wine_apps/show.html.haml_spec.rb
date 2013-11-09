require 'spec_helper'

describe "wine_apps/show" do
  before(:each) do
    @wine_app = assign(:wine_app, stub_model(WineApp))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
