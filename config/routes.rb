Rails.application.routes.draw do  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html  
  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users

  resources :stocks

  root to: 'pages#index'  

  get '/listings' => 'listings#index', as: 'listings'
  get '/listings/:id' => 'listings#show', as: 'listing'

  # get '/stocks' => 'stocks#index', as: 'stocks'
  # get '/stocks/new' => 'stocks#new', as: 'new_stock'
  # post '/stocks' => 'stocks#create'

  get '/transactions' => 'transactions#index', as: 'transactions'

end
