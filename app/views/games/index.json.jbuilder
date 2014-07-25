json.array!(@games) do |game|
  json.extract! game, :id, :start_date, :end_date, :league_id
  json.url game_url(game, format: :json)
end
