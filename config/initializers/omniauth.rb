require 'omniauth-steam'

Rails.application.config.middleware.use OmniAuth::Builder do
  raise Exception, 'STEAM_APP_KEY env is blank!' if !ENV['STEAM_APP_KEY']
  provider :steam, ENV['STEAM_APP_KEY']
end
