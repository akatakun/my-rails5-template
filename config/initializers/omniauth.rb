require 'omniauth-steam'

Rails.application.config.middleware.use OmniAuth::Builder do
  if ENV['TWITTER_APP_KEY'] && ENV['TWITTER_SECRET']
    provider :twitter, ENV['TWITTER_APP_KEY'], ENV['TWITTER_SECRET']
  end

  if ENV['STEAM_APP_KEY']
    provider :steam, ENV['STEAM_APP_KEY']
  end
end
