RailsAdmin.config do |config|
  config.parent_controller = 'ApplicationController'

  ### Popular gems integration

  ## == Devise ==
  config.current_user_method(&:current_user)
  config.authenticate_with do
    warden.authenticate! scope: :user
  end

  ## == Cancan ==
  config.authorize_with :cancan

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
