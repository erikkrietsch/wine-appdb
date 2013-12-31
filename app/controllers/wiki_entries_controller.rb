class WikiEntriesController < ApplicationController
  before_action :set_wiki_entry, only: [:show]
  def show 
  end

  def index
    @wiki_entries = WikiEntry.find(wikiable_type: "WineApp", wikiable_id: params[:wine_app_id])
  end

  private
    def set_wiki_entry
      @wiki_entry = WikiEntry.find(params[:id])
    end

end
