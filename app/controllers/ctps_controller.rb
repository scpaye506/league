class CtpsController < InheritedResources::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, except: [:new, :create, :update, :edit, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    ctp = Ctp.create({player_id: params[:playerId], game_id: params[:gameId], hole: params[:input]})
    respond_to do |format|
      if ctp.save
        @message = "CTP Added!"
        format.html { redirect_to game_path(params[:gameId]), notice: @message }
        format.json {render json: {message: @message}.to_json }
      else
        @message = "Was unable to save CTP!"
        format.html { redirect_to game_path(params[:gameId]), notice: @message}
        format.json { render json: score.errors }
      end
    end
  end

  def destroy
    ctp = Ctp.find(params[:id])
    ctp.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: "Ctp deleted!" }
      format.json { head :no_content }
    end
  end

  protected
    def permitted_params
      params.require(:ctp).permit(:player_id, :game_id, :hole)
    end
end
