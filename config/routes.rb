Rails.application.routes.draw do
  get 'ideas/index'

  get 'ideas/create'

  get 'ideas/show'

  get 'ideas/destroy'

  root 'users#new'

  resources :users

	# post 'register' => 'users#create'
	# post 'sessions' => 'sessions#create'
	post 'like/:id' => 'ideas#like'
	get 'likes/:id' => 'ideas#likes'
	get 'logout' => 'sessions#destroy'
	delete 'idea/:id' => 'ideas#destroy'

  delete 'logout' => 'sessions#destroy'

  resources :users, exclude: [:index], via: [:get, :post]
  resources :sessions
  resources :ideas

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
