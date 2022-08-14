Rails.application.routes.draw do  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html  
  # Defines the root path route ("/")
  # root "articles#index"
  
  devise_for :users
  
  resources :listings do
    resources :stocks
  end

  root to: 'pages#index'  

  get   '/portfolio' => 'pages#portfolio', as: 'portfolio'
  get   '/new' => 'pages#new', as: 'new_trader'
  get   '/user/:id' => 'pages#show', as: 'user'
  patch '/user/:id' => 'pages#update'
  get   '/user/:id/edit' => 'pages#edit', as: 'user_edit'
  post  '/' => 'pages#create'  
  get   '/confirm_user/:trader_id' => 'pages#confirm_user', as: 'confirm_user'
  get   '/balance' => 'pages#balance', as: 'balance'
  patch '/balance' => 'pages#add_money'

  get   '/listings/:listing_id/buy', to: 'stocks#buy', as: 'buy_stock'
  get   '/listings/:listing_id/sell', to: 'stocks#sell', as: 'sell_stock'

  get   '/trader/transactions' => 'transactions#index', as: 'transactions'
  get   '/trader/transactions/:id' => 'transactions#show', as: 'transaction'
  
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

end
