class SessionController < ApplicationController
  def new
  end

  def create
 	  auth_token = params[:oauth_token]
  	@auth = request.env['omniauth.auth']
  	auth_secret = @auth['credentials']['secret']
  	twitter_username = @auth['info']['nickname']

  	user = User.find_by_username(@twitter_username)
  	if user
  		session[:user_id] = user.id
  	else
  		redirect_to user_new_url
    end
  end

  def destroy
  end
end
