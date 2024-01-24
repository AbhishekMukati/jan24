Rails.application.routes.draw do
  root "articles#index"

  resources :articles do
    resources :comments
  end
  resources :products do
    resources :comments
  end
  resources :orders do
    resources :comments
  end
end
