Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  get 'prototypes/popular' => 'prototypes#popular'
  get 'prototypes/newest' => 'prototypes#newest'
  resources :prototypes, only: [:index, :new, :create, :show] do
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
