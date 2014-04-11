Comuna::Application.routes.draw do
  #root :to => 'welcome#index'

  resources :users
  resources :gcems
  resources :roles
  resources :events
  resources :reports
  resources :events_user
end
