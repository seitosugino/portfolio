Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'posts#top'
  get 'about' => 'posts#about'
  get "rank" => "posts#rank"
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
  resources :categories,only: [:index,:create,:show,:edit,:update]
  resources :rates,only: [:show,:create]
  resources :messages, only: [:create]
  resources :rooms, only: [:index,:create,:show]
  resources :groups, except: [:destroy] do
    member do
      get :join
    end
  end
  resources :group_posts, only: [:create]
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'
  resources :items,only: [:index,:new,:create,:show,:edit,:update] do
    resources :item_likes, only: [:create, :destroy]
    member do
      get :rates
    end
  end
  resources :cart_items,only: [:index,:create,:show,:edit,:update, :destroy] do
    collection do
      delete :cart_destroy
    end
  end
  resources :orders,only: [:index,:new,:create,:show,:edit,:update] do
    collection do
      post :log
      get :thanks
    end
    member do
      get :sell
      get :customer
      get :all
    end
  end
  resources :addresses,only: [:index,:create,:edit,:update,:destroy]
  resources :genres,only: [:index,:create,:show,:edit,:update]
  resources :item_rates,only: [:show,:create]
  resources :order_items,only: [:update]
end
