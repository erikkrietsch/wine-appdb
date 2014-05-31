class WineApp < ActiveRecord::Base
  belongs_to :developer
  has_many :problems, class_name: "WineAppProblem"
  has_many :votes
  has_many :wiki_entries, class_name: "WikiEntry", as: :wikiable, source: :wikiable
  has_many :screenshots
  validates :name, presence: true
  validates :slug, presence: true
  accepts_nested_attributes_for :screenshots
  def create
    WineApp.create(wineapp_params)
  end

  def to_param
    return slug
  end

  def descriptions
    wiki_entries.where(:wiki_type => "description")
  end

  def install_intructions
    wiki_entries.where(:wiki_type => "install_intruction")
  end

  def wine_instructions
    wiki_entries.where(:wiki_type => "wine_instruction")
  end

  def description
    descriptions.order(updated_at: :desc).first.to_s || ""
  end

  def name=(value)
    super
    self.slug = value.parameterize  
    return self.name
  end

  private

    def wineapp_params
      params.require(:wine_app).permit(:name, :description, screenshots_attributes: [:wine_app_id, :title, :image], vote:[:difficulty_value, :quality_value])
    end
end