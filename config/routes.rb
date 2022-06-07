Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  get 'search' => 'searches#search_result'
  get 'books/search/sort_new', to: 'books#search', as: 'sort_new'
  get 'books/search/sort_rate', to: 'books#search', as: 'sort_rate'

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end

