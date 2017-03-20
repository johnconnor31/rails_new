class UsersController < ApplicationController
  def index
  end
  def new
  	@user=User.new
  end
  def create
  	@user= User.create(user_params)
  	if @user.save
    flash.now.alert = 'Signed up!'
  		redirect_to log_in_url, :notice => 'Signed up!' 
  	else
  		render 'new'
  	end
  end
  def createFB
    @user= User.from_omniauth(env["omniauth.auth"])
    session[:name] = @user.name
    if @user.save
      redirect_to root_path, :notice => 'Signed up!' 
    else
      render 'new'
    end
  end
	private def user_params
	params.require(:user).permit(:name,:password)
	end
  private def fb_params
    userFB= User.new
    auth = env["omniauth.auth"]
    userFB.provider = auth.provider
    userFB.uid = auth.uid
    userFB.name = auth.info.name
    userFB.oauth_token = auth.credentials.token
    userFB.oauth_expires_at = Time.at(auth.credentials.expires_at)
    params.require(:userFB).permit(:uid,:name,:provider,:oauth_token,:oauth_expires_at)
  end
end