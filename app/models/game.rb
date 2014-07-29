class Game < ActiveRecord::Base
  belongs_to :dg_league #, :inverse_of => :game
  has_many :scores
  has_many :players, through: :scores
  has_many :ctps

  #for admin page
  def name
    "#{start_date}"
  end

end
