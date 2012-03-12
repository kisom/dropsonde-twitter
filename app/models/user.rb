class User < ActiveRecord::Base
	attr_accessible :username, :auth_token, :auth_secret, :sms
	validates_uniqueness_of :username, :auth_token, :auth_secret
	validates_presence_of :sms, :username, :auth_secret, :auth_token
end
