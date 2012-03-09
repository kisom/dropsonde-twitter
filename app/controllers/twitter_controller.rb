class TwitterController < ApplicationController
  def auth
  	consumer_key = ENV['CONSUMER_KEY']
  	consumer_secret = ENV['CONSUMER_SECRET']
  end

  def receive
  end

  def send
  end
end
