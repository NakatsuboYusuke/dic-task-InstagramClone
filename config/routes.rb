Rails.application.routes.draw do

  root to: 'homes#index'
  resources :pictures do
    collection do
      post :confirm
    end
  end

end
