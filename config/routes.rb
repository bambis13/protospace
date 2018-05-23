Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  get 'prototypes/popular' => 'prototypes#popular'
  get 'prototypes/newest' => 'prototypes#newest'
  resources :users, only: [:show, :edit, :update]
  resources :prototypes do
    resources :comments, only: [:create, :destroy, :edit, :update]
    resources :likes, only: [:create, :destroy]
  end

end
