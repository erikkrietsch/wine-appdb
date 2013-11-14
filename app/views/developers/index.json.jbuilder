json.array!(@developers) do |developer|
  json.extract! developer, 
  json.url developer_url(developer, format: :json)
end
