Rails.application.routes.draw do
  root to: 'sessions#welcome'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/user_signup', to: 'users#new'
  post '/user_signup', to: 'users#create'
  get '/employer_signup', to: 'employers#new'
  post '/employer_signup', to: 'employers#create'

  resources :users
  resources :employers
  resources :jobs
end
