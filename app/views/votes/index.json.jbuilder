json.array!(@votes) do |vote|
  json.vote do
  	json.id vote.id
  	json.userid vote.user_id
  	json.difficulty vote.difficulty_value
  	json.quality vote.quality_value 
  	json.ip_address vote.ip_address
  end
end
