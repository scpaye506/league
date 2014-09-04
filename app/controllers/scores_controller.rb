class ScoresController < InheritedResources::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, except: [:new, :create, :update, :edit, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    if Player.find(params[:playerId]).scores.joins(:game).where("games.id = ?", params[:gameId]).count == 0
      score = Score.create({player_id: params[:playerId], game_id: params[:gameId], value: params[:input]})

      respond_to do |format|
        if score.save
          @message = "Score Added!"
          format.html { redirect_to game_path(params[:gameId]), notice: @message }
          format.json {render json: {message: @message}.to_json }
        else
          @message = "Was unable to save score!"
          format.html { redirect_to game_path(params[:gameId]), notice: @message}
          format.json { render json: score.errors }
        end
      end
    else
      respond_to do |format|
        @message = "Score already exists for that user"
        format.html { redirect_to game_path(params[:gameId]), notice: @message}
        format.json { render json: {message: @message}.to_json }
      end
    end
  end

  def destroy
    score = Score.find(params[:id])
    score.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: "Score deleted!" }
      format.json { head :no_content }
    end
  end

protected
    def permitted_params
      params.require(:score).permit(:player_id, :game_id, :value)
    end
end
