class WikiEntry < ActiveRecord::Base
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
end
