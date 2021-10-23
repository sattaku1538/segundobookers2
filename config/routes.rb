Rails.application.routes.draw do
 root to: 'homes#top'
 devise_for :users
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get 'home/about' => 'homes#about'
 resources :books, only: [:index, :create, :show, :edit, :update, :destroy] 
 resources :users, only: [:show, :edit, :update, :index]
  
end
