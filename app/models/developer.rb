class Developer < ActiveRecord::Base
  has_many :wine_apps
  validates :name, presence: true, uniqueness: true
  def create
    Developer.create(developer_params)
  end

  private
    def developer_params
        params.require(:developer).permit(:name, :description, :url, :logo)
    end
end
