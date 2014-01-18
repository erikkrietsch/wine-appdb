class VotesController < ApplicationController
  before_action :find_vote, only: [:create]
  def create
    @vote ||= Vote.new
    @vote.quality_value = params[:vote][:quality_value]
    @vote.difficulty_value = params[:vote][:difficulty_value]
    @vote.ip_address = request.remote_ip
    @vote.user = current_user if user_signed_in?
    @vote.wine_app = @wine_app

    if @vote.save
      redirect_to @wine_app, notice: "Vote was successfully recorded."
    else
      redirect_to @wine_app, notice: "Vote was not added. #{@vote.errors.first}"
    end
  end

  private
    def vote_params
      params[:vote]
    end

    def find_vote
      @wine_app = WineApp.find(params[:wine_app_id])
      # common_args = { wine_app_id: params[:wine_app_id], vote_type: params[:vote_type] }
      if user_signed_in?
        @vote = @wine_app.votes.find_by(user_id: current_user)
        # @vote = Vote.all.where(common_args.merge({ user_id: current_user }) ).first
      else
        @vote = @wine_app.votes.where(user_id: nil, ip_address: request.remote_ip).first
        # @vote = Vote.all.where(common_args.merge({ user_id: nil, ip_address: request.remote_ip }) ).first
      end
    end
end
