Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  end
  resources :users
  get 'home/about' => 'home#about'
end