Rails.application.routes.draw do
  get 'votes/create'

  get 'votes/destroy'

	devise_for :users, controllers: {
		sessions: 'users/sessions'
	}

	root  'places#index'
	resources :places do
		collection do
     		get :mine
    	end
		resources :comments, only: [:create, :destroy]
		#resources :votes, only: [:create, :destroy]
		resources :votes, only: [:create, :update]
	end
	
	resources :categories, only: [:show, :index]
	
	#get 'places/new', to: 'places#new'
	#get 'places', to: 'places#index'
	#get 'places/:id', to: 'places#show', as:"place"
	#post 'places', to: 'places#create'
end
