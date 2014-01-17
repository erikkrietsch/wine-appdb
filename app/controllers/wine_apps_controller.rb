class WineAppsController < ApplicationController
  # respond_to(:html)
  # expose(:wine_apps) { WineApp.order(:name) }
  # expose(:wine_app)
  before_action :set_wine_app, only: [:update, :show, :edit, :destroy, :description_history]
  before_action :authenticate_user!, only: [:update, :edit, :destroy]


  def index
    @wine_apps = WineApp.order(:name) 
  end

  def show
    build_scatterchart

  end

  def edit
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
        @wine_app.descriptions << description
      end
    end

    def build_scatterchart
      @vote_data = GoogleVisualr::DataTable.new
      @vote_data.new_column('number', 'Difficulty')
      @vote_data.new_column('number', 'Within 3 Months')
      @vote_data.new_column('number', '3-6 Months')
      @vote_data.new_column('number', '6+ Months')
      blank_data = GoogleVisualr::DataTable.new
      blank_data.new_column('number', 'Difficulty')
      blank_data.new_column('number', 'Within 3 Months')
      blank_data.new_column('number', '3-6 Months')
      blank_data.new_column('number', '6+ Months')

      @wine_app.votes.each do |v|
        @vote_data.add_row([v.difficulty_value, v.quality_value, nil, nil])
      end

      # @wine_app.votes.old.each do |v|
      #   @vote_data.add_row(v.difficulty_value, nil, v.quality_value, nil)
      # end

      # @wine_app.votes.oldest.each do |v|
      #   @vote_data.add_row(v.difficulty_value, nil, nil, v.quality_value)
      # end

      options = {
        width: 150, 
        height: 100, 
        pointSize: 3,
        legend: "none",
        series: [{
          dataOpacity: 1.0,
          color: "#3366CC"
        },{
          dataOpacity: 0.7,
          color: "#3366CC"
        },{
          dataOpacity: 0.3,
          color: "#3366CC"
        }], 
        hAxis: {
          title: "Simplicity", 
          minValue: 0, 
          maxValue: 5,
          textPosition: "none"
        },
        vAxis: {
          title: "Quality", 
          minValue: 0, 
          maxValue: 5,
          textPosition: "none"
        }, 
        animation: {
          duration: 400, 
          easing: "out" 
        }
      }

     
      # opts   = { :width => 400, :height => 240, :title => 'Age vs. Weight comparison',
      #            :hAxis => { :title => 'Age'    , :minValue => 0, :maxValue => 15 },
      #            :vAxis => { :title => 'Weight' , :minValue => 0, :maxValue => 15 },
      #            :legend => 'none' }
      @vote_chart = GoogleVisualr::Interactive::ScatterChart.new(@vote_data, options)
     

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wine_app_params
      params.require(:wine_app).permit([:name])
    end
end
