Rails.application.routes.draw do
  devise_for :users
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root :to => "topics#index"

	resources :topics do
		resources :comments
	end

	resources :users
end
