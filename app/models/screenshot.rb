class Screenshot < ActiveRecord::Base
  belongs_to :wine_app
  belongs_to :user

  has_attached_file :image, 
  bucket: "appdb_screenshots",
  styles: {
    thumb: "100x100>",
    square: "200x200#",
    medium: "300x300>"
  }

  def create
    Screenshot.create(:set_screenshot_params)
  end

  private
    def set_screenshot_params
      params.require(:screenshot).permit(:image)
    end
end
