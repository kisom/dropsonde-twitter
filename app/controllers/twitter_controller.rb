class TwitterController < ApplicationController
  def auth

  end

  def receive
  end

  def send(foo, options = {})
  	logger.debug "FOO: #{foo}"
  	logger.debug "OPTS: #{options}"
  end
end
