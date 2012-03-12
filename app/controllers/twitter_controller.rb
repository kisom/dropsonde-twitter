class TwitterController < ApplicationController
  
  # receive a direct message
  def receive
  	puts "RECIEVE"
  end

  # send a direct message
  def send(foo, options = {})
    auth
    @user = User.find(session[:uid])
    @message = params[:message]
    @recipient = params[:recipient]
    twitter = Twitter::Client.new(:oauth_access =>
      { :key => @user., :secret => ACCESS_SECRET })
    twitter.message(:post, message, recipient)
  end

  def auth(callback = nil, auth = {})
    @user = User.find(session[:uid])
    if @user.nil?
      redirect_to '/auth/twitter'
  	Twitter.configure do |config|
  		config.consumer_key = ENV['CONSUMER_KEY']
  		config.consumer_secret = ENV['CONSUMER_SECRET']
  		config.oauth_token = @user.auth_token
  		config.oauth_secret = @user.auth_secret
  	end
  end

end
