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
  post '/sign_user_up', to: 'jobs#sign_up_for_job'
  post '/remove_from_job', to: 'jobs#remove_from_job'

  resources :users
  resources :employers do
    resources :jobs
  end
  resources :employers
  resources :jobs
end
