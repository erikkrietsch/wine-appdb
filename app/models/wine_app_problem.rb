
class WineAppProblem < ActiveRecord::Base
  belongs_to :bug_report
  belongs_to :wine_app
  has_many :problems, class_name: "WikiEntry", as: :wikiable
  has_many :workarounds, class_name: "WikiEntry", as: :wikiable

  def create
    WineAppProblem.create(wineapp_problem_params)
  end

  def problem
    problems.order(updated_at: :desc).first
  end

  def workaround
    workarounds.order(updated_at: :desc).first
  end

  private
    def wineapp_problem_params
      # require(:wine_app_problem).permit(:problem, :workaround)
    end
end

