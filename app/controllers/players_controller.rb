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
    create!  { root_url }
  end

  protected
    def permitted_params
      params.permit(:player => [:first_name, :last_name, :middle_nam, :gender, :classification])
    end
end
