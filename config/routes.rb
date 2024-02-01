Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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

  resources :users do
    # resources :comments
  end
end
