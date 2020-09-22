Rails.application.routes.draw do
  devise_for :admins, controllers: {
  	sessions: 'admins/sessions'
  }
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get "users/show" => "users#show"
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
    resources :relationships, only: [:create, :destroy, :index]
    get "show_tweets" => "tweets#show_tweets"
    resources :tweets do
      resources :comments, only: [:create, :destroy]
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
