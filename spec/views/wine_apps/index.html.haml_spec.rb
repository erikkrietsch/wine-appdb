require 'spec_helper'

describe "wine_apps/index" do
  before(:each) do
    assign(:wine_apps, [
      stub_model(WineApp),
      stub_model(WineApp)
    ])
  end

  it "renders a list of wine_apps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
