Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :users, only: [:show]
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end  
  resources :restaurants, only: [:index]
  resources :shops, only: [:index]
  resources :spots, only: [:index]

end
