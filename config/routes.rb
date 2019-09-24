Rails.application.routes.draw do

  root to: 'homes#index'

  resources :pictures do
    collection do
      post :confirm
    end
  end

  resources :users

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
