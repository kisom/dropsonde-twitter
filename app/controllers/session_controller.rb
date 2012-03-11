class SessionController < ApplicationController
  def new
  end

  def create
 	  auth_token = params[:oauth_token]
  	@auth = request.env['omniauth.auth']
    auth_token =  @auth['credentials']['token']
  	auth_secret = @auth['credentials']['secret']
  	twitter_username = @auth['info']['nickname']

    begin
  	  user = User.find_by_username(@twitter_username)
    rescue
      user = nil
    end
  	if user
  		session[:user_id] = user.id
  	else
      session[:auth_token] = auth_token
      session[:auth_secret] = auth_secret
      session[:username] = twitter_username

  		redirect_to new_user_url
    end
  end

  def destroy
  end
end
