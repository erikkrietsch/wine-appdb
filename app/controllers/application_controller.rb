class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def find_wine_app
  	@wine_app ||= WineApp.find_by_slug( params[:wine_app_id] || params[:id] )
  end
end
