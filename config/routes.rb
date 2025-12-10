Rails.application.routes.draw do
  
  get 'search/search'
  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about", as: 'about'
  get "users/my_page" => "users#my_page", as: "my_page"
  resources :recipes
  resources :users, only: [:show, :edit, :update, :destroy]
  get "search", to: "search#search"
end
