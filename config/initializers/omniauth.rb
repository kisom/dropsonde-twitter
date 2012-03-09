twitter_consumer_key = ENV['CONSUMER_KEY']
twitter_consumer_secret = ENV['CONSUMER_SECRET']

Rails.application.config.middleware.use OmniAuth::Builder do
      provider :twitter, twitter_consumer_key, twitter_consumer_secret
end
