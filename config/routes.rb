Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :users, only: [:show, :edit, :update]
  resources :prototypes, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create, :index]
  end

end
