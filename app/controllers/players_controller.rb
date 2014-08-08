class PlayersController < InheritedResources::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, except: [:new, :create, :update, :edit, :destroy]
end
