class DgLeague < ActiveRecord::Base
  has_many :games #, :inverse_of => :db_league
  has_many :players, through: :games
  has_many :scores, through: :games
  has_many :ctps, through: :games

  def url_by_name
    "/#{name.gsub(" ", "_")}"
  end
  def league_address
    "#{address1} #{address2}, #{city}, #{state} #{zip}"
  end
end
