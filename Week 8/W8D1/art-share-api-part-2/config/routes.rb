Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end
  resources :artworks, only: [:show, :create, :update, :destroy] do
    resources :comments, only: [:index]
  end
  resources :comments, only: [:create, :destroy]
  resources :artwork_shares, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
