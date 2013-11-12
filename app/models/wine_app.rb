class WineApp < ActiveRecord::Base
  has_one :developer
  validates :name, presence: true
  def create
    WineApp.create(wineapp_params)
  end

  private

    def wineapp_params
      params.require(:wine_app).permit(:name, :description)
    end
end
