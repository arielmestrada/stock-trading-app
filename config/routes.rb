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
  get '/transactions' => 'transactions#index', as: 'transactions'

end
