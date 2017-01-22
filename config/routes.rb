Rails.application.routes.draw do

  namespace :domain do
    get 'user_domains/new'
  end

  namespace :domain do
    get 'domain_users/new'
  end

  namespace :domain do
    get 'domains/new'
  end

  get "set_language/update"
  post "/rate" => "rater#create", :as => "rate"
  devise_for :admins, path: "admin",
    controllers: {sessions: "admin/sessions"}
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  get "index" => "static_pages#index"
  root "static_pages#home"
  mount ActionCable.server => "/cable"
  namespace :admin do
    root "home#index", path: "/"
    resources :orders, only: [:index, :show, :destroy]
    resources :shop_requests, only: [:index, :update]
    resources :categories
    resources :users
    resources :products, only: :index
    resources :set_user, only: :create
    resources :shops, except: [:new, :create, :show]
    resources :request_shop_domains
  end

  namespace :dashboard do
    root "statistics#index", path: "/"
    resources :shops do
      resources :products
      resources :orders
      resources :shop_managers, only: [:index, :create, :destroy]
      resources :order_managers, only: :index
      resources :order_products
      resources :accepted_order_products, defaults: {format: "json"}
    end
    resources :statistics
  end
  resources :domains do
    resources :products
    resources :shops
    resources :orders
    resources :carts
    resources :shop_domains
    namespace :dashboard do
      root "statistics#index", path: "/"
      resources :shops do
        resources :products
      end
    end
  end
  resources :user_domains
  resources :shop_domains

  resources :shops, only: [:index, :show, :update]
  resources :products, only: [:index, :show, :new] do
    resources :comments, only: :create
  end
  resources :comments, only: :destroy
  resources :carts
  resources :orders
  resource :orders
  resources :users, only: :show
  resources :events, only: [:index, :update] do
    post :read_all, on: :collection
  end
  resources :categories do
    resources :products
  end
  resources :tags, only: :show
  get "search(/:search)", to: "searches#index", as: :search

  resources :request_shop_domains
end
