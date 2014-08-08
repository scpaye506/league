class DgLeaguesController < InheritedResources::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, except: [:new, :create, :update, :edit, :destroy]

  def show
    if params[:id]
      @dg_league = DgLeague.find(params[:id])
    else
      @dg_league = DgLeague.where(name: params[:name].gsub("_", " ")).first
    end

    @games = @dg_league.games
  end
end
