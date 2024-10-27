Rails.application.routes.draw do
  devise_for :users
  resources :photos, only: [:show, :new, :create] do
    resources :comments, only: :create
  end
  root to: 'photos#index'
end
