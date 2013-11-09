require 'spec_helper'

describe "wine_apps/edit" do
  before(:each) do
    @wine_app = assign(:wine_app, stub_model(WineApp))
  end

  it "renders the edit wine_app form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wine_app_path(@wine_app), "post" do
    end
  end
end
