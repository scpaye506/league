class ScoresController < InheritedResources::Base

  def create
    create! { edit_resource_url }
  end

  protected
    def permitted_params
      params.permit(:score => [:player_id, :game_id, :value])
    end
end
