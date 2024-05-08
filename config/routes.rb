Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'books#index'

  resources :books

  get 'search', to: 'searches#index'

	scope module: :apps do
		resource :profile, only: [:show, :edit, :update]
		resources :bookmarklists, only: [:index]
	end

	namespace :api, defaults: {format: :json} do
		scope '/books/:book_id' do
			resource :bookmark, only: [:show, :create, :destroy]
		end
	end
end
