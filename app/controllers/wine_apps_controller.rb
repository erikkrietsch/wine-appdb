class WineAppsController < ApplicationController
  # respond_to(:html)
  # expose(:wine_apps) { WineApp.order(:name) }
  # expose(:wine_app)
  before_action :set_wine_app, only: [:update, :show, :edit, :destroy]
  before_action :authenticate_user!, only: [:update, :edit, :destroy]

  def index
    @wine_apps = WineApp.order(:name) 
  end

  def show
    add_breadcrumb "All Apps", wine_apps_path
    add_breadcrumb @wine_app.name, :show
    @vote = @wine_app.votes.find_by(user_id: current_user) || Vote.new
  end

  def edit
    add_breadcrumb "All Apps", wine_apps_path
    add_breadcrumb @wine_app.name, @wine_app
    add_breadcrumb "Edit", :edit
  end

  def new
    @wine_app = WineApp.new
  end

  # POST /wine_apps
  # POST /wine_apps.json
  def create
    @wine_app = WineApp.new(wine_app_params)
    set_wine_app_description
    set_wine_app_screenshot
    respond_to do |format|
      if @wine_app.save
        # unless wine_app.developer 
        #   format.html { redirect_to }
        format.html { redirect_to @wine_app, notice: 'App was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wine_app }
      else
        format.html { render action: 'new' }
        format.json { render json: @wine_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wine_apps/1
  # PATCH/PUT /wine_apps/1.json
  def update
    set_wine_app_description
    set_wine_app_screenshot
    respond_to do |format|
      if @wine_app.update(wine_app_params)
        format.html { redirect_to @wine_app, notice: 'App was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wine_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wine_apps/1
  # DELETE /wine_apps/1.json
  def destroy
    @wine_app.destroy
    respond_to do |format|
      format.html { redirect_to wine_apps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine_app
      begin
        @wine_app = WineApp.find(params[:id])
      rescue PG::NumericValueOutOfRange, ActiveRecord::RecordNotFound
        redirect_to wine_apps_url, notice: "App not found."
      end
    end

    def set_wine_app_screenshot
      return unless params[:screenshot]
      screenshot = Screenshot.new
      screenshot.image = params[:screenshot]
      screenshot.title = params[:screenshot_title]
      screenshot.user = current_user
      @wine_app.screenshots << screenshot
    end

    def set_wine_app_description
      if @wine_app.description != params[:wine_app][:description]
        description = WikiEntry.new
        description.content = params[:wine_app][:description]
        description.user = current_user
        description.wiki_type = "description"
        @wine_app.wiki_entries << description
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wine_app_params
      params.require(:wine_app).permit([:name])
    end
end
