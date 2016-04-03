Rails.application.routes.draw do
  devise_for :users 

  resource :user do
  	resources :lists do
    	resources :items
    end
  end
  
  root "home#home"
end