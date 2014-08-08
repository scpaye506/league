class ScoresController < InheritedResources::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, except: [:new, :create, :update, :edit, :destroy]

  def create
    if Player.find(params[:score][:player_id]).scores.joins(:game).where("games.id = ?", params[:score][:game_id]).count == 0
      score = Score.create(permitted_params)

      respond_to do |format|
        if score.save
          format.html { redirect_to :back, notice: "Score added!" }
          format.json { render json: score.to_json.html_safe}
        else
          format.html { redirect_to :back, notice: "Was unable to save score!"}
          format.json { render json: score.errors }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, notice: "Score already exists for that user"}
        format.json { render json: {notice: "Score already exists for that user"}.to_json }
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
