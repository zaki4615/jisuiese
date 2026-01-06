Rails.application.routes.draw do


  devise_for :admins, path: 'admin', controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
   resources :users, only: [:index, :show, :destroy]
  end
  
  
  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about", as: 'about'
  get "users/my_page" => "users#my_page", as: "my_page"
  resources :recipes do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :destroy]
  get "search", to: "search#search"

  resources :relationships, only: [:create, :destroy]

  resources :users do
   member do
     get :following
     get :followers
   end
  end 
end
