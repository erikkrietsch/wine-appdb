class WikiEntriesController < ApplicationController
  before_action :set_wiki_entry, only: [:show]
  def show 
  end

  def index
    @page_title = "Wike Entries"
    @wiki_entries = find_wiki_entries
  end

  private
    def set_wiki_entry
      @wiki_entry = WikiEntry.find(params[:id])
    end

    def find_wikiable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          begin
            return $1.classify.constantize.find(value)
          rescue ActiveRecord::RecordNotFound
            nil
          end
        end
      end
      nil
    end

    def find_wiki_entries
      @wikiable = find_wikiable
      nil unless @wikiable
      if @wikiable.is_a?(WineApp)
        if request.fullpath.include? "/descriptions"
          @page_title = "Descriptions"
          return @wikiable.descriptions.order(updated_at: :desc)
        elsif request.fullpath.include? "/install_instructions"
          @page_title = "Install Instructions"
          return @wikiable.install_instructions.order(updated_at: :desc)
        elsif request.fullpath.include? "/wine_instructions"
          @page_title = "Wine Instructions"
          return @wikiable.wine_instructions.order(updated_at: :desc)
        end
      end
    end


end
