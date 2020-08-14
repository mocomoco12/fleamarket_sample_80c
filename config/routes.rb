Rails.application.routes.draw do
  get 'purchases/buy'
  get 'purchases/pay'
  get 'card/new'
  get 'card/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products do
    resource :purchases do
      member do
        get  "buy"
        post "pay"
      end
    end
  end


  resources :users
  resources :card, only: [:new, :create, :index, :destroy] do
    # get '/patients/:id', to: 'patients#show', as: 'patient'
    # delete '/card/:id', to: 'card#destroy', as:'card'
  end
  # resources :card, only: [:new, :show,:create] do
  #   collection do
  #     post 'show', to: 'card#show'
  #     post 'pay', to: 'card#pay'
  #     post 'destroy', to: 'card#destroy'
  #   end
  # end
end
