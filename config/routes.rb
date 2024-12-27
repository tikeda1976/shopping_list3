Rails.application.routes.draw do
  get 'items/create'
  # ホーム画面のルート設定 (root)
  root 'home#index' # ホーム画面は home#index に変更

  # アイテム作成用のルート設定
  resources :items, only: [:create] # アイテムの作成のみ許可

  # 他の静的ページのルート設定
  get 'home/index'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # ユーザー関連のルート設定
  resources :users do
    member do
      get :following, :followers
    end
  end

  # アカウント認証関連のルート設定
  resources :account_activations, only: [:edit]

  # マイクロポスト関連のルート設定
  resources :microposts,          only: %i[create destroy]

  # リレーションシップ関連のルート設定
  resources :relationships,       only: %i[create destroy]

  # 旧ルート設定 (必要に応じて)
  get '/microposts', to: 'static_pages#home'

  # ここからlistsコントローラのルーティングを追加
  resources :lists, only: [:index, :new, :create, :show, :edit, :update, :destroy]

end



