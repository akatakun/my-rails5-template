Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: 'letter_opener' if Rails.env.development?

  post '/users/auth/:provider/callback', to: 'omniauth_sessions#create'
  devise_for :users

  root to: 'home#index'

  get 'home/index'
end
