Rails.application.routes.draw do
  resources :cashbacks, only: %i[index show update] do
    member do
      post :mark_expired
    end
  end
  resources :orders
  resources :users do
    member do
      get :orders_with_cashback
      post :redeem_cashback
    end
  end
  resources :restaurants do
    member do
      get :orders_with_cashback
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
