class CtpsController < InheritedResources::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, except: [:new, :create, :update, :edit, :destroy]

  def create
    ctp = Ctp.create(permitted_params)
    respond_to do |format|
      if ctp.save
        format.html { redirect_to :back, notice: "CTP added!" }
        format.json { render json: ctp.to_json.html_safe}
      else
        format.html { redirect_to :back, notice: "Was unable to save CTP!"}
        format.json { render json: ctp.errors }
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
