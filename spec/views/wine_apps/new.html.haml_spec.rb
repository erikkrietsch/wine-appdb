require 'spec_helper'

describe "wine_apps/new" do
  before(:each) do
    assign(:wine_app, stub_model(WineApp).as_new_record)
  end

  it "renders new wine_app form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wine_apps_path, "post" do
    end
  end
end
