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
      { :key => @user.auth_token, :secret => @user.auth_secret })
    twitter.message(:post, message, recipient)
  end

  def auth(callback = nil, auth = {})
    @user = User.find(session[:uid])
    if @user.nil?
      redirect_to '/auth/twitter'
      Twitter::Client.configure do |conf|
        conf.oauth_consumer_token = ENV['CONSUMER_TOKEN']
        conf.oauth_consumer_secret = ENV['CONSUMER_SECRET']
      end
  end

end
