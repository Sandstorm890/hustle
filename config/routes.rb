Rails.application.routes.draw do
  resources :users
  resources :employers do
    resources :jobs
  end
  resources :jobs
end
