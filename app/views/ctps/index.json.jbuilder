json.array!(@ctps) do |ctp|
  json.extract! ctp, :id, :hole, :player_id, :game_id
  json.url ctp_url(ctp, format: :json)
end
