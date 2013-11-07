class AppController < ApplicationController
  def show
    @wine_app = WineApp.find(params[:id])
    
  end


end
