class Score < ActiveRecord::Base
  belongs_to :player
  belongs_to :game

  def adjusted_score
    value + player.calc_handicap(game.start_date, game.dg_league_id)
  end
end
