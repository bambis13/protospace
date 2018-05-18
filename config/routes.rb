Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  get 'prototypes/popular' => 'prototypes#popular'
  get 'prototypes/newest' => 'prototypes#newest'
  resources :prototypes, only: [:index, :new, :create, :show]
  resources :users, only: [:show, :edit, :update]
end
