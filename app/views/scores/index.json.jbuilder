json.array!(@scores) do |score|
  json.extract! score, :id, :value, :player_id, :game_id
  json.url score_url(score, format: :json)
end
