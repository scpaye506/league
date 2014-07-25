json.array!(@dg_leagues) do |dg_league|
  json.extract! dg_league, :id, :address1, :address2, :city, :state, :zip, :name, :description, :par
  json.url dg_league_url(dg_league, format: :json)
end
