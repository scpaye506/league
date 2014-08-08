class GamesController < InheritedResources::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, except: [:new, :create, :update, :edit, :destroy]

  def show
    if params[:id]
      @game = Game.find(params[:id])
    else
      @dg_league = DgLeague.where(name: params[:name].gsub("_", " ")).first
    end
    @score = Score.new()
    @ctp = Ctp.new()

  #  @games = @dg_league.games
  end


  protected
    def permitted_params
      params.permit(:game => [:dg_league_id, :start_date, :end_date])
    end
end
