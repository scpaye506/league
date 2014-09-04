json.players @players do |player|
	json.name player.name
	json.id player.id
end

json.message @message