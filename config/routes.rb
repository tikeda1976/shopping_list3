Rails.application.routes.draw do
  root 'lists#index' # ホーム画面をリスト一覧に設定
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :lists, only: %i[index create destroy] do
    member do
      get :detail, to: 'details#show' # 詳細画面
    end
    resources :items, only: %i[create destroy], controller: 'details'
  end  
  resources :account_activations, only: [:edit]
  resources :microposts,          only: %i[create destroy]
  resources :relationships,       only: %i[create destroy]
  resources :lists, only: %i[index create destroy]
  get '/microposts', to: 'static_pages#home'
end
