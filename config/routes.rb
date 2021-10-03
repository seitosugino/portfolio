Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'posts#top'
  resources :posts,only: [:index,:new,:create,:show,:edit,:update,]
  resources :customers,only: [:index,:show,:edit,:update,]
  resources :tag
  resources :categories,only: [:show,]
end
