class Game < ActiveRecord::Base
  belongs_to :dg_league #, :inverse_of => :game
  has_many :scores
  has_many :players, through: :scores
  has_many :ctps

  #for admin page
  def name
    "#{start_date}"
  end

  def get_player_score(playerId)
    scores.where('player_id = ?', playerId).first
  end

  def formatted_ctps(playerId)
    formatted_string = ""
    players_ctps = ctps.where('player_id = ?', playerId)
    players_ctps.each do |ctp|
      unless ctp == players_ctps.last
        formatted_string += "#{ctp.hole}, "
      else
        formatted_string += "#{ctp.hole}"
      end
    end
    formatted_string
  end

end
