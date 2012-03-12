class SessionController < ApplicationController
  def new
  end

  def create
    reset_session
  	
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
      session[:auth_token] = auth_token
      session[:auth_secret] = auth_secret
      session[:username] = twitter_username

  		session[:uid] = user.id
      redirect_to {:controller => :users, :action => :update}
  	else
      session[:auth_token] = auth_token
      session[:auth_secret] = auth_secret
      session[:username] = twitter_username

  		redirect_to new_user_url
    end
  end

  def destroy
    reset_session
  end

  def dev
    session[:auth_token] = 'foo'
    session[:auth_secret] = 'bar'
    session[:username] = 'bazquux'

    redirect_to new_user_url
  end

end
