class Player < ActiveRecord::Base
  has_many :scores
  has_many :games, through: :scores
  has_many :dg_leagues, through: :games
  has_many :ctps

  def name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def score_for_game(id)
    scores.joins(:game).where('games.id = ?', id).first
  end

  def best_score(date, league_id)
    @scores = scores.joins(:game).where('games.start_date < ? AND games.dg_league_id = ?', date, league_id).order(value: :desc).pluck(:value)
    @scores.pop
  end

  def last_scores(date, league_id, n)
    scores.joins(:game).where('games.start_date < ? AND games.dg_league_id = ?', date, league_id).pluck(:value).last(n)
  end

  def calc_handicap(date, league_id)
    #have to add in check for which league
    @scores = scores.joins(:game).where('games.start_date < ? AND games.dg_league_id = ?', date, league_id).order(value: :asc).pluck(:value).last(6)
    if @scores.count == 0
      return 5
    elsif @scores.count  > 5
      @scores.pop
    end

    @value = @scores.inject{|sum,x| sum + x }
    (@value / @scores.count) - 54
  end
end
