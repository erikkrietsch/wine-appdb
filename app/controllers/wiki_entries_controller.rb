class WikiEntriesController < ApplicationController
  before_action :set_wiki_entry, only: [:show]
  # before_action :find_wikiable, only: [:create]
  def show 
  end

  def create  
    wikiable = find_wikiable
    # binding.pry
    collection_name = params[:wiki_type]
    if %w[descriptions install_instructions wine_instructions].include?(collection_name)
      wiki_entry = WikiEntry.new
      wiki_entry.content = params[:wiki_entry]
      wiki_entry.user = current_user
      wikiable.send(collection_name) << wiki_entry
      if wikiable.save
        respond_to do |format|
          format.html { redirect_to @wikiable, notice: "Entry saved." }
          format.json { render json: { message: "Entry saved." }.to_json }
        end
      else
        respond_to do |format|
          format.html { redirect_to @wikiable, notice: "Error saving entry: #{wiki_entry.errors.first}" }
          format.json { render json: { message: "Error saving entry: #{wiki_entry.errors.first}." }.to_json }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @wikiable, notice: "Error saving entry: Bad collection name."  }
        format.json { render json: { message: "Error saving entry: Bad collection name." }.to_json }
      end      
    end
  end

  def index
    @page_title = "Wiki Entries"
    @wikiable = find_wikiable
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
      wikiable = @wikiable || find_wikiable
      nil unless wikiable
      if wikiable.is_a?(WineApp)
        if request.fullpath.include? "/descriptions"
          @page_title = "Descriptions"
          return wikiable.descriptions.order(updated_at: :desc)
        elsif request.fullpath.include? "/install_instructions"
          @page_title = "Install Instructions"
          return wikiable.install_instructions.order(updated_at: :desc)
        elsif request.fullpath.include? "/wine_instructions"
          @page_title = "Wine Instructions"
          return wikiable.wine_instructions.order(updated_at: :desc)
        end
      end
    end


end
