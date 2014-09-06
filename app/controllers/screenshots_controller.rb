class ScreenshotsController < ApplicationController
  before_action :find_wine_app
  before_action :set_screenshot, only: [:show, :edit, :update, :destroy]

  # GET /screenshots
  # GET /screenshots.json
  def index
    @screenshots = @wine_app ? @wine_app.screenshots : Screenshot.all.to_a
  end

  # GET /screenshots/1
  # GET /screenshots/1.json
  def show
    find_wine_app
  end

  # GET /screenshots/new
  def new
    @screenshot = Screenshot.new
  end

  # GET /screenshots/1/edit
  def edit
  end

  # POST /screenshots
  def create
    @screenshot = Screenshot.new(screenshot_params)

    if @screenshot.save
      redirect_to @screenshot, notice: 'Screenshot was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /screenshots/1
  def update
    if @screenshot.update(screenshot_params)
      redirect_to @screenshot, notice: 'Screenshot was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /screenshots/1
  def destroy
    @screenshot.destroy
    redirect_to (@wine_app ? wine_app_path(@wine_app) : :screenshots)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screenshot
      @screenshot = Screenshot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def screenshot_params
      params[:screenshot]
    end
end
