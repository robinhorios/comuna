Comuna::Application.routes.draw do
  root :to => 'home#index'
  resources :users
  resources :cells
  resources :roles
  resources :events
  resources :reports
  resources :events_user
  resource :confirmation, only: [:show]
end
