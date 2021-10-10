Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'posts#top'
  resources :posts,only: [:index,:new,:create,:show,:edit,:update] do
    resources :likes, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    member do
      get :rates
    end
  end
  resources :customers,only: [:index,:show,:edit,:update] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :categories,only: [:show]
  resources :rates,only: [:show,:create]
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  resources :groups, except: [:destroy]
end
