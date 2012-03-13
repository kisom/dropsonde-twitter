class SessionController < ApplicationController
  def new
  end

  def create
    reset_session
  	
    @auth = request.env['omniauth.auth']

    session[:auth_token] = @auth['credentials']['token']
    session[:auth_secret] = @auth['credentials']['secret']
    session[:username] = @auth['info']['nickname']

    begin
  	  user = User.find_by_username(@twitter_username)
    rescue
      user = nil
    end
  	unless user.nil?
  		session[:uid] = user.id
      redirect_to :controller => :users, :action => :update
  	else
  		redirect_to new_user_url
    end
  end

  def destroy
    reset_session
  end

  # care needs to be taken with this, because it will auto login as the user
  # we only want this on the development environment, because twitter will
  # not let us callback to localhost.
  def dev
    should_dev = (ENV['RAILS_ENV'] == 'development') or
                 (ENV['RAILS_ENV'] == 'test')
    if should_dev
      @user = User.find_by_username('kyleisom')
      session[:auth_token] = @user.auth_token
      session[:auth_secret] = @user.auth_secret
      session[:username] = @user.username
      session[:uid] = @user.id
    end
    
    redirect_to home_index_url
  end

end
