class TwitterController < ApplicationController
  
  def receive
  	puts "RECIEVE"
  end

  # def send(foo, options = {})
  # 	puts "SEND"
  # end

  def auth(callback = nil, auth = {})
  	@auth_token = params[:oauth_token]
  	@auth = request.env['omniauth.auth']
  	# Twitter.configure do |config|
  	# 	config.consumer_key = ENV['CONSUMER_KEY']
  	# 	config.consumer_secret = ENV['CONSUMER_SECRET']
  	# 	config.oauth_token = @auth_token
  	# 	config.oauth_secret = @auth_secret
  	# end
  end

end
