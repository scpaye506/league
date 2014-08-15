# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

players = Player.create([{first_name: "Adam", last_name: "Bell", middle_name: "", gender: "Male", classification: "Adult"}])

league = DgLeague.create({name: "Sugaw Creek Am League", address1: "939 Sugar Creek Rd", address2: "", city: "Charlotte", state: "NC", zip: "28213", par: "54", description: "SUGAW CREEK AM LEAGUE presented by ALPINE SKI CENTER Handicap is a measure of capability derived by taking the six most recent rounds, dropping the high score and averaging the remaining five. Prior to recording six scores, a player's handicap is an estimation, factoring in each most recent round. The Tournament Director may disregard any round deemed not indicative of a player's capability, marked with an *. New men begin at -5, women and kids at -15. Maximum handicap: men -15; women, kids -25; little kids, TD discretion." })

game1 = Game.create({dg_league_id: league.id, start_date: Date.today, end_date: Date.today})
[54].each_with_index do |score, index|
  if score
    Score.create({player_id: players[index].id, value: score, game_id: game1.id})
  end
end

game2 = Game.create({dg_league_id: league.id, start_date: Date.today, end_date: Date.today})
[55].each_with_index do |score, index|
  if score
    Score.create({player_id: players[index].id, value: score, game_id: game2.id})
  end
end

game3 = Game.create({dg_league_id: league.id, start_date: Date.today, end_date: Date.today})
[56].each_with_index do |score, index|
  if score
    Score.create({player_id: players[index].id, value: score, game_id: game3.id})
  end
end

game4 = Game.create({dg_league_id: league.id, start_date: Date.today, end_date: Date.today})
[57].each_with_index do |score, index|
  if score
    Score.create({player_id: players[index].id, value: score, game_id: game4.id})
  end
end

game5 = Game.create({dg_league_id: league.id, start_date: Date.today, end_date: Date.today})
[58].each_with_index do |score, index|
  if score
    Score.create({player_id: players[index].id, value: score, game_id: game5.id})
  end
end

game6 = Game.create({dg_league_id: league.id, start_date: Date.today, end_date: Date.today})
[59].each_with_index do |score, index|
  if score
    Score.create({player_id: players[index].id, value: score, game_id: game6.id})
  end
end