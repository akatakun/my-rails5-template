require 'omniauth-steam'

Rails.application.config.middleware.use OmniAuth::Builder do
  raise Exception, 'TWITTER_APP_KEY env is blank!' if !ENV['TWITTER_APP_KEY']
  raise Exception, 'TWITTER_SECRET env is blank!' if !ENV['TWITTER_SECRET']
  provider :twitter, ENV['TWITTER_APP_KEY'], ENV['TWITTER_SECRET']

  raise Exception, 'STEAM_APP_KEY env is blank!' if !ENV['STEAM_APP_KEY']
  provider :steam, ENV['STEAM_APP_KEY']
end
