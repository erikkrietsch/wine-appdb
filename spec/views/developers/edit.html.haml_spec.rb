require 'spec_helper'

describe "developers/edit" do
  before(:each) do
    @developer = assign(:developer, stub_model(Developer))
  end

  it "renders the edit developer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", developer_path(@developer), "post" do
    end
  end
end
