class TwitterController < ApplicationController
  
  # receive a direct message
  def receive
  	puts "RECIEVE"
  end

  # send a direct message
  def send(foo, options = {})
  end

  def auth(callback = nil, auth = {})
  	Twitter.configure do |config|
  		config.consumer_key = ENV['CONSUMER_KEY']
  		config.consumer_secret = ENV['CONSUMER_SECRET']
  		config.oauth_token = @auth_token
  		config.oauth_secret = @auth_secret
  	end
  end

end
