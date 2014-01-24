# include ActionView::Helpers
class WikiEntry < ActiveRecord::Base
  before_validation :sanitize_content
  belongs_to :wikiable, :polymorphic => true
  belongs_to :user

  def create
    WikiEntry.create(:wiki_entry_params)
  end

  def to_s
    self.content
  end

  private
    def wiki_entry_params
      params.require(:wiki_entry).permit(:content)
    end

    def sanitize_content
      self.content = ActionController::Base.helpers.strip_tags(self.content)
    end
end
