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
  end
  resources :customers,only: [:index,:show,:edit,:update] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :tag
  resources :categories,only: [:show]
end
