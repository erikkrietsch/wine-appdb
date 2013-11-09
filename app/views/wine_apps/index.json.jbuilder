json.array!(@wine_apps) do |wine_app|
  json.extract! wine_app, 
  json.url wine_app_url(wine_app, format: :json)
end
