class TwitterController < ApplicationController
  
  def receive
  	puts "RECIEVE"
  end

  # def send(foo, options = {})
  # 	puts "SEND"
  # end

  def auth(callback = nil, auth = {})
  	puts auth
  	@auth_token = params[:oauth_token]
  end

end
