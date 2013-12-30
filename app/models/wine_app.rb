class WineApp < ActiveRecord::Base
  belongs_to :developer
  has_many :problems, class_name: "WineAppProblem"
  has_many :votes
  has_many :descriptions, class_name: "WikiEntry", as: :wikiable
  has_many :install_instructions, class_name: "WikiEntry", as: :wikiable
  has_many :wine_instructions, class_name: "WikiEntry", as: :wikiable
  validates :name, presence: true
  def create
    WineApp.create(wineapp_params)
  end

  def description
    descriptions.order(updated_at: :desc).first.to_s || ""
  end

  private

    def wineapp_params
      params.require(:wine_app).permit(:name, :description)
    end
end