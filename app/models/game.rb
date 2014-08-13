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

  def rank(score)
    scores.where('value < ?', score).count + 1
  end

  def players_by_rank(fraction = 1)
    scores_array = []
    scores.sort {|a,b| a.value <=> b.value}.each  do |score|
      scores_array.push({name: score.player.name, rank: rank(score.value), score: score.value})
    end
    count = scores_array.count / fraction
    scores_array.first(count)
  end

  def players_by_adjusted_rank(fraction = 1)
    scores_array = []
    scores.sort {|a,b| a.adjusted_score <=> b.adjusted_score}.each  do |score|
      scores_array.push({name: score.player.name, rank: nil, score: score.adjusted_score})
    end

    scores_array.each do |score|
      score[:rank] = scores_array.select{|x| x[:score] < score[:score]}.count + 1
    end

    count = scores_array.count / fraction
    scores_array.first(count)
  end

end
