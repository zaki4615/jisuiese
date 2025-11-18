Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about", as: 'about'
  resources :recipes, only: [:new, :index, :show, :create]
  
end
