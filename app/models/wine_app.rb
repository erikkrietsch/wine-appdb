class WineApp < ActiveRecord::Base
  belongs_to :developer
  has_many :problems, class_name: "WineAppProblem"
  has_many :votes
  has_many :descriptions, class_name: "WikiEntry", as: :wikiable, source: :wikiable, source_type: "WineAppDescription"
  has_many :install_instructions, class_name: "WikiEntry", as: :wikiable, source: :wikiable, source_type: "WineAppInstallInstruction"
  has_many :wine_instructions, class_name: "WikiEntry", as: :wikiable, source: :wikiable, source_type: "WineAppWineInstruction"
  has_many :screenshots
  validates :name, presence: true
  accepts_nested_attributes_for :screenshots
  def create
    WineApp.create(wineapp_params)
  end

  def description
    descriptions.order(updated_at: :desc).first.to_s || ""
  end

  private

    def wineapp_params
      params.require(:wine_app).permit(:name, :description, screenshots_attributes: [:wine_app_id, :title, :image], vote:[:difficulty_value, :quality_value])
    end
end