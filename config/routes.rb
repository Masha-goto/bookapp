Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'books#index'

  resources :books do
    resource :bookmark, only: [:show, :create, :destroy]
  end

  resource :profile, only: [:show, :edit, :update]
  resources :bookmarklists, only: [:index]
end
