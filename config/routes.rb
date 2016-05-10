Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show, :index]
  root 'welcome#index'
  resources :friendships, only: [:create, :destroy, :accept] do
    member do 
      put :accept
    end
  end 


end
