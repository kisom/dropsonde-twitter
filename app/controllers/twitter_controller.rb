class TwitterController < ApplicationController
  
  def receive
  	puts "RECIEVE"
  end

  # def send(foo, options = {})
  # 	puts "SEND"
  # end

  def auth(callback = nil, auth = {})
  	puts "AUTH"
   	puts "CB: #{callback}"
   	puts "AUTH: #{auth}"
  end

end
