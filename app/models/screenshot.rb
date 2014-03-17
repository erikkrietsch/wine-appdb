class Screenshot < ActiveRecord::Base
  belongs_to :wine_app
  belongs_to :user
  has_attached_file :image, 
  bucket: "appdb_screenshots",
  styles: {
    thumb: "80x80>",
    square: "200x200#",
    medium: "300x300>"
  }
  validates :title, presence: true
  validates :image, presence: true

  def create
    Screenshot.create(:set_screenshot_params)
  end

  private
    def set_screenshot_params
      params.require(:screenshot).permit(:image, :title, :user)
    end
end
