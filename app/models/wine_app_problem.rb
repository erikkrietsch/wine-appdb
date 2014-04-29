
class WineAppProblem < ActiveRecord::Base
  belongs_to :bug_report
  belongs_to :wine_app
  belongs_to :wine_version
  has_many :wiki_entries, class_name: "WikiEntry", as: :wikiable
  
  validates :wine_version, presence: true
  
  def create
    WineAppProblem.create(wineapp_problem_params)
  end

  def problems
    wiki_entries_type("problem")
  end

  def workarounds
    wiki_entries_type("workaround")
  end

  def problem
    problems.order(updated_at: :desc).first
  end

  def workaround
    workarounds.order(updated_at: :desc).first
  end

  private
    def wineapp_problem_params
      require(:wine_app_problem).permit(:problem, :workaround, :wine_version)
    end

    def wiki_entries_type(wiki_type)
      wiki_entries.where(wiki_type: wiki_type)
    end


end

