require 'spec_helper'

describe WineAppProblem do
  let(:problem) { FactoryGirl.create(:wine_app_problem) }

  it "should not have a blank/nil Problem value" do
    expect(problem.problem).to_not be_nil
  end

  it "should not have blank/nil Workaround value" do
    expect(problem.workaround).to_not be_nil
  end
end
