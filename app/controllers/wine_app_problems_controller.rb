class WineAppProblemsController < ApplicationController
  before_action :set_wine_app_problems, only: [:index]
  before_action :set_wine_app_problem, only: [:show]
  def index
    
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine_app_problems
        @wine_app = WineApp.find_by_id(params[:wine_app_id])
        @problems = @wine_app ? @wine_app.problems : WineAppProblem.all
    end

    def set_wine_app_problem
      begin
        @problem = WineAppProblem.find(params[:id])
      rescue PG::NumericValueOutOfRange, ActiveRecord::RecordNotFound
        redirect_to wine_app_problems_url, notice: "Requested problem not found."
      end
    end
end
