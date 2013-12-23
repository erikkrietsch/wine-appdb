class WineApp < ActiveRecord::Base
  has_one :developer
  belongs_to_and_has_many :bug_reports
  has_many :votes
  has_many :descriptions, class_name :wiki_entry
  has_many :install_instructions, class_name :wiki_entry
  has_many :wine_instructions, class_name :wiki_entry
  validates :name, presence: true
  def create
    WineApp.create(wineapp_params)
  end

  private

    def wineapp_params
      params.require(:wine_app).permit(:name, :description)
    end
end