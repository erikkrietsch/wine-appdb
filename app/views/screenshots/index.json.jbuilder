json.array!(@screenshots) do |screenshot|
  json.extract! screenshot, 
  json.url screenshot_url(screenshot, format: :json)
end
