class Logo < ActiveRecord::Base
  belongs_to :wine_app
  belongs_to :user
  has_attached_file :image, 
  bucket: "appdb_logos",
  styles: {
    thumb: "80x80>",
    square: "200x200#",
    medium: "300x300>"
  }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :image, presence: true

  def create
    Logo.create(:set_logo_params)
  end

  private
    def set_logo_params
      params.require(:logo).permit(:image, :user)
    end
end
