Rails.application.routes.draw do
  resources :users
  
  resource :session

  resource :cart

  resources :products do
    resources :selections
  end

  resources :orders

  root to: 'products#index'
end
