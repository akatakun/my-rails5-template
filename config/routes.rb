Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: 'letter_opener' if Rails.env.development?

  match '/users/auth/:action/callback', controller: 'omniauth_sessions', via: :all
  devise_for :users

  root to: 'home#index'

  get 'home/index'
end
