Rails.application.routes.draw do

  root to: 'homes#index'

  # pictures
  resources :pictures do
    collection do
      post :confirm
    end
  end

  # users
  resources :users
  get '/users/:id/feed', to: 'users#feed'

  # sessions
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # to sessions
  post '/users', to: 'sessions#create'

  # favorites
  resources :favorites, only: [:create, :destroy]

  # 404, 500
  #get '*path', controller: 'application', action: 'render_404'

end
