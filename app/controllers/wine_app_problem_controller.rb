class WineAppProblemController < ApplicationController
  def index
    @problems = @wine_app ? @wine_app.problems : WineAppProblem.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end
end
