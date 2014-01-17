class VotesController < ApplicationController
  before_action :find_vote, only: [:create]
  def create
    @vote ||= Vote.new
    if params[:vote_type].downcase == "difficulty"
      @vote.difficulty_value = params[:value]
      @vote.quality_value ||= 1
    elsif params[:vote_type].downcase == "quality"
      @vote.quality_value = params[:value]
      @vote.difficulty_value ||= 1
    end
    @vote.ip_address = request.remote_ip
    @vote.user = current_user if user_signed_in?
    @vote.wine_app = @wine_app

    if @vote.save
      redirect_to @wine_app, notice: 'Vote was successfully recorded.' 
    else
      redirect_to @wine_app, notice: 'Vote was not added.'
    end
  end

  private
    def find_vote
      @wine_app = WineApp.find(params[:wine_app_id])
      # common_args = { wine_app_id: params[:wine_app_id], vote_type: params[:vote_type] }
      if user_signed_in?
        @vote = @wine_app.votes.where(user_id: current_user).first
        # @vote = Vote.all.where(common_args.merge({ user_id: current_user }) ).first
      else
        @vote = @wine_app.votes.where(user_id: nil, ip_address: request.remote_ip).first
        # @vote = Vote.all.where(common_args.merge({ user_id: nil, ip_address: request.remote_ip }) ).first
      end
    end
end
