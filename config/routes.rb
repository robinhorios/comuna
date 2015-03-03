Comuna::Application.routes.draw do
  	devise_for :users, :path_prefix => 'my'
	root :to => 'home#index'
	resources :users
	resources :cells
	resources :roles
	resources :events
	resources :events_user
	get 'report', to: 'reports#index'
end
