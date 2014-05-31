module ApplicationHelper
  def find_wine_app
    WineApp.find_by_slug( params[:wine_app_id] || params[:id] )
  end
end
