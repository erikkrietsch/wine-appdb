require 'spec_helper'

describe "wine_app_problems/index" do
  it "should collect all problems in @problems without a wine_app" do
    # seed the test db with wap records™
    @problems = assign(:problems, WineAppProblem.all)
    render
    @problems.each do |p|
      binding.pry
      expect(rendered).to contain(p.problem)
    end
  end

  it "should collect only an app's problems in @problems when given a wine_app" do
    pending
  end
end