Rails.application.routes.draw do

  root to: 'homes#index'

  # pictures
  resources :pictures do
    resources :comments
    collection do
      post :confirm
    end
  end

  # users
  resources :users do
    member do
      get :feed
    end
  end
  #get '/users/:id/feed', to: 'users#feed'

  # sessions
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # to sessions
  post '/users', to: 'sessions#create'

  # favorites
  resources :favorites, only: [:create, :destroy]

  # letter_opener
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # 404, 500
  get '*path', controller: 'application', action: 'render_404'

end
