require 'spec_helper'

describe "developers/new" do
  before(:each) do
    assign(:developer, stub_model(Developer).as_new_record)
  end

  it "renders new developer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", developers_path, "post" do
    end
  end
end
