Rails.application.routes.draw do  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html  
  # Defines the root path route ("/")
  # root "articles#index"
  
  devise_for :users
  
  resources :listings do
    resources :stocks
  end

  root to: 'pages#index'  

  get '/portfolio' => 'pages#portfolio', as: 'portfolio'
  get '/new' => 'pages#new', as: 'new_trader'
  get '/confirm_user/:trader_id' => 'pages#confirm_user', as: 'confirm_user'
  get '/transactions' => 'transactions#index', as: 'transactions'


end
