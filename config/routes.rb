Rails.application.routes.draw do
  get 'users/top'
  devise_for :admins, conrollers: {
  	sessions: 'admins/sessions'
  }
  devise_for :users
  root :to => 'homes#top'
  get 'homes/top'
  get 'homes/about'
  
  namespace :admins do
  	resources :users
  end

  namespace :users do
  	get 'users/top'
    resources :users
    resources :shops
    resources :blogs
    resources :tweets
    resources :relationships
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
