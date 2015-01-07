Comuna::Application.routes.draw do
  #root :to => 'welcome#index'

  resources :users
  resources :cells
  resources :roles
  resources :events
  resources :reports
  resources :events_user
end
