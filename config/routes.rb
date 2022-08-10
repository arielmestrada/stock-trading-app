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
  get '/:id' => 'pages#show', as: 'user'
  patch '/:id' => 'pages#update'
  get '/:id/edit' => 'pages#edit', as: 'user_edit'
  post '/' => 'pages#create'
  get '/confirm_user/:trader_id' => 'pages#confirm_user', as: 'confirm_user'
  get 'user/transactions' => 'transactions#index', as: 'transactions'


end
