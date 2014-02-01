class VotesController < ApplicationController
  before_action :find_vote, only: [:create]
  before_action :find_wineapp, only: [:index]
  
  def create
    @vote ||= Vote.new
    @vote.quality_value = params[:vote][:quality_value]
    @vote.difficulty_value = params[:vote][:difficulty_value]
    @vote.ip_address = request.remote_ip
    @vote.user = current_user if user_signed_in?
    @vote.wine_app = @wine_app

    if @vote.save
      respond_to do |format|
        format.html { redirect_to @wine_app, notice: "Vote was successfully recorded." }
        format.json { render json: {message: "Vote was recorded." }.to_json }
      end
    else
      respond_to do |format|
        format.html { redirect_to @wine_app, notice: "Vote was not added. #{@vote.errors.first}" }
        format.json { render json: "{'message': 'Vote was not saved'}" }
      end
    end
  end

  def index
    respond_to do |format|
      format.html { redirect_to @wine_app }
      format.json { render json: prepare_votes_json }
    end
  end

  private
    def vote_params
      params[:vote]
    end

    def find_vote
      find_wineapp
      if user_signed_in?
        @vote = @wine_app.votes.find_by(user_id: current_user)
      else
        @vote = @wine_app.votes.where(user_id: nil, ip_address: request.remote_ip).first
      end
    end

    def find_wineapp
      @wine_app = WineApp.find(params[:wine_app_id])
    end

    # because this is a bit hard to read: we first have a definition of the columns to be presented in the vote_chart
    # object in the DOM for a given WineApp model. The first column is the difficulty rating. This value never depreciates
    # over time. The next series of values represent how old a vote is. Check the Vote model for more information about aging.
    # The Google Charts DataTable object can be expressed in a literal, which is what this method is producing. For cool, wow
    # whiz-bang whoosh effects, we're producing the "live data" elements to represent all the actual data, then deep-copying
    # that data to preserve the original reference, and then applying "0" where there once was a voted value. We'll first draw
    # the chart with the zeroed-out values, and then after a delay, draw the chart with the actual data to get an animated effect. 
    def prepare_votes_json
      @wine_app || find_wineapp 
      live_data = Hash.new
      live_data[:cols] = [
                        {id: "difficulty", label: "Difficulty", type: "number"},
                        {id: "6+Months", label: "6+ Months", type: "number"},
                        {id: "3-6months", label: "3-6 Months", type: "number"},
                        {id: "recent", label: "Recent", type: "number"}                        
                      ]
      live_data[:rows] = @wine_app.votes.oldest.map { |v| { c: [{v: v.difficulty_value}, {v: v.quality_value}, {v: nil}, {v: nil}] } }
      live_data[:rows] += @wine_app.votes.old.map { |v| { c: [{v: v.difficulty_value}, {v: nil}, {v: v.quality_value}, {v: nil}] } }
      live_data[:rows] += @wine_app.votes.recent.map { |v| { c: [{v: v.difficulty_value}, {v: nil}, {v: nil}, {v: v.quality_value}] } }

      blank_data = Marshal.load(Marshal.dump(live_data))
      blank_data[:rows].each { |r| r[:c].each_with_index { |c, i| c[:v] = 0 if c[:v] unless i == 0 } }

      output = { live_data: live_data, blank_data: blank_data }

      return output.to_json
    end

end
