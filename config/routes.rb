Rails.application.routes.draw do
  resource :cart

  resources :products do
    resources :selections
  end

  root to: 'products#index'
end
