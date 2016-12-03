class UsersController < ApplicationController
  def index
  end
  def new
  	@user=User.new
  end
  def create
  	@user= User.new(user_params)
  	if @user.save
      flash.now.alert = 'Signed up!'
  		redirect_to log_in_url, :notice => 'Signed up!' 
  	else
  		render 'new'
  	end
  end
	private def user_params
	params.require(:user).permit(:name,:password)
	end
end