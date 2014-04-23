require 'spec_helper'

describe WineAppProblem do
  let(:problem) { FactoryGirl.build(:wine_app_problem) }

  it "should not have a blank/nil Problem value" do
    binding.pry
    expect(problem.problem).to_not eq ""
    expect(problem.problem).to_not be nil
  end
end
