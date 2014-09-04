class PlayersController < InheritedResources::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, except: [:new, :create, :update, :edit, :destroy]

  def destroy
    player = Player.find(params[:id])
    player.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: "Player deleted!" }
      format.json { head :no_content }
    end
  end

  def create
    player = Player.create(permitted_params2)

      respond_to do |format|
        if player.save
          format.html { redirect_to :back, notice: "Player added!" }
          format.json { render json: player.to_json.html_safe}
        else
          format.html { redirect_to :back, notice: "Was unable to save player!"}
          format.json { render json: player.errors }
        end
      end
  end

  def search
    respond_to do |format|
      format.html do
        raise ActionController::RoutingError.new('Not Found')
      end
      format.json do
        limit = params[:limit] ? params[:limit] : 10;
        if params[:name]
          @players = Player.find_by_fuzzy_name(params[:name], limit: limit)
          @message = "Found #{@players.count}"
        else
          @message = "Name Required"
        end
      end
    end
  end

  protected
    def permitted_params
      params.permit(:player => [:first_name, :last_name, :middle_nam, :gender, :classification])
    end
    def permitted_params2
      params.require(:player).permit(:first_name, :last_name, :middle_nam, :gender, :classification)
    end
end
