class PagesController < ApplicationController
  def index
    @dg_leagues = DgLeague.all
    @players = Player.all
    @games = Game.all
  end
end
