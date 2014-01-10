class VotesController < ApplicationController
  before_action :find_vote, only: [:create]
  def create
    @vote ||= Vote.new
    @vote.value = params[:value]
    @vote.vote_type = params[:vote_type]
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
      common_args = { wine_app_id: params[:wine_app_id], vote_type: params[:vote_type] }
      if user_signed_in?
        @vote = Vote.all.where(common_args.merge({ user_id: current_user }) ).first
      else
        @vote = Vote.all.where(common_args.merge({ user_id: nil, ip_address: request.remote_ip }) ).first
      end
    end
end
