class GamesController < ApplicationController
before_action :findById, only: [:show,:edit,:update,:destroy]

def create
	@game= Game.new(game_params)
	if @game.save
		flash.now.alert='Game created successfully'
		redirect_to games_all_path, :notice => 'Game created successfully'
	else
		flash.now.alert='Game creation failed'
		render 'new'
	end
end
def new 
	@game= Game.new
end
def show
end
def edit
end
def update

	if @game.update(game_params)
		redirect_to root_path
	else
		render 'edit'
	end
end
def destroy
	if @game.destroy
		redirect_to root_path
	else
		render 'show'
	end
end
def index
  	@games= Game.order(created_at: :desc).all()
  	@gravatar= "https://s.gravatar.com/avatar/ff53357b167dc2851b74e3a8f993fc1b?s=80"
end
def findById
		@game=Game.find(params[:id])
end
private def game_params
	return params.require(:game).permit(:name,:from,:review,:image)
end
end