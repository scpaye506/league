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

  def destroy
    dgleague = DgLeague.find(params[:id])
    dgleague.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: "League deleted!" }
      format.json { head :no_content }
    end
  end

  protected
    def permitted_params
      params.permit(:dg_league => [:address1, :address2, :city, :state, :zip, :name, :description, :par])
    end
end
