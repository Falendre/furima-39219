Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create] do
    post '/', to: 'items#create', as: :create
  end
end
