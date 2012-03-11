class SessionController < ApplicationController
  def new
  end

  def create
 	  auth_token = params[:oauth_token]
  	@auth = request.env['omniauth.auth']
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
  		redirect_to new_user_url
    end
  end

  def destroy
  end
end
