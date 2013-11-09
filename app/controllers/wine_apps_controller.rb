class WineAppsController < ApplicationController
  before_action :set_wine_app, only: [:show, :edit, :update, :destroy]

  # GET /wine_apps
  # GET /wine_apps.json
  def index
    @wine_apps = WineApp.all
  end

  # GET /wine_apps/1
  # GET /wine_apps/1.json
  def show
  end

  # GET /wine_apps/new
  def new
    @wine_app = WineApp.new
  end

  # GET /wine_apps/1/edit
  def edit
  end

  # POST /wine_apps
  # POST /wine_apps.json
  def create
    @wine_app = WineApp.new(wine_app_params)

    respond_to do |format|
      if @wine_app.save
        format.html { redirect_to @wine_app, notice: 'Wine app was successfully created.' }
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
    respond_to do |format|
      if @wine_app.update(wine_app_params)
        format.html { redirect_to @wine_app, notice: 'Wine app was successfully updated.' }
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
      @wine_app = WineApp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wine_app_params
      params[:wine_app]
    end
end
