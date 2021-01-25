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
  post '/sign_user_up', to: 'jobs#add_or_remove_from_job'
  get '/jobs/sort_by_rate', to: 'jobs#sort_by_rate'
  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :users, only: [:new, :create, :show]
  resources :employers do
    resources :jobs, only: [:new, :show, :edit, :create, :destroy]
  end
  resources :users do
    resources :jobs, only: [:update, :show, :add_or_remove_from_job]
  end
  resources :employers, only: [:new, :create]
  resources :jobs
  resources :tools, only: [:index, :show, :update]
end
