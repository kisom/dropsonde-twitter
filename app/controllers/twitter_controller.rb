require 'twitter'

class TwitterController < ApplicationController
  
  # receive a direct message
  # INOP because project was ixnayed
  def receive
  end

  # send a direct message
  def send(callback, options)
    if session[:uid].nil?
      redirect_to '/auth/twitter'
      return
    end

    auth  # call auth first to make sure we are authenticated
    @user = User.find(session[:uid])
    @message = params[:message]
    @recipient = params[:recipient]
    twitter = Twitter::Client.new(:oauth_access =>
      { :key => @user.auth_token, :secret => @user.auth_secret })
    twitter.message(:post, @message, @recipient)

    respond_to do |format|
      format.html 
      format.json {render json: { :status => '200', 
        :message => {:recipient => @recipient,
                     :message => @message}}}
    end
  end

  def auth
    if session[:uid].nil?
      redirect_to '/auth/twitter'
    end

    @user = User.find(session[:uid])

    if @user.nil?
      redirect_to '/auth/twitter'
    end
  end

end
