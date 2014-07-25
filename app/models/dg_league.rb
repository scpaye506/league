class DgLeague < ActiveRecord::Base
  has_many :games
  has_many :players, through: :games
  has_many :scores, through: :games
  has_many :ctps, through: :games

  def url_by_name
    "/#{name.gsub(" ", "_")}"
  end
end
