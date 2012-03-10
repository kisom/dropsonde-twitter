class TwitterController < ApplicationController
  
  def receive
  	puts "RECIEVE"
  end

  # def send(foo, options = {})
  # 	puts "SEND"
  # end

  def auth(callback = nil, auth = {})
  	auth_token = params[:query_string['oauth_token']]
  end

end
