class Player < ActiveRecord::Base
  has_many :scores
  has_many :games, through: :scores
  has_many :ctps

  def name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def score_for_game(id)
    scores.joins(:game).where('games.id = ?', id).pluck(:value).first
  end
end
