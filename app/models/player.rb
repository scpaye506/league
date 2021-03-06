class Player < ActiveRecord::Base
  has_many :scores, dependent: :destroy
  has_many :games, through: :scores
  has_many :dg_leagues, through: :games
  has_many :ctps, dependent: :destroy

  fuzzily_searchable :name

  def name_changed?
    first_name_changed? || middle_name_changed? || last_name_changed?
  end

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

  def capability(date, league_id)
    @scores = scores.joins(:game).where('games.start_date < ? AND games.dg_league_id = ?', date, league_id).pluck(:value).last(6).sort

    if @scores.count == 0
      return 54.0
    elsif @scores.count  > 5
      @scores.pop
    end

    value = @scores.inject{|sum,x| sum + x }
    (value.to_f / @scores.count.to_f).round(1)
  end

  def last_scores(date, league_id, n)
    scores.joins(:game).where('games.start_date < ? AND games.dg_league_id = ?', date, league_id).pluck(:value).last(n)
  end

  def calc_handicap(date, league_id)
    @scores = scores.joins(:game).where('games.start_date < ? AND games.dg_league_id = ?', date, league_id).pluck(:value).last(6).sort

    if @scores.count == 0
      if gender == "Female" || classification == "Child"
        return -15
      end
      return -5
    elsif @scores.count  > 5
      @scores.pop
    end

    value = @scores.inject{|sum,x| sum + x }
    value = (value.to_f / @scores.count.to_f)

    if value > 54.0
      value = value.floor
    else
      value = value.ceil
    end

    value = 54 - value

    if gender == "Male"
      if value < -15 && classification == "Adult"
        value = -15
      end
    else
      if value < -25 && classification == "Adult"
        value = -25
      end
    end

    value
  end
end
