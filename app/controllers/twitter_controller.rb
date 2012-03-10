class TwitterController < ApplicationController
  def auth
  	puts "auth controller"
  end

  def receive
  end

  def send(foo, options = {})
  	puts "FOO: #{foo}"
  	puts "OPTS: #{options}"
  end
end
