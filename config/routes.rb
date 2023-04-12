Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "search_queries#index"
  # post "/search_queries", to: "search_queries#create", as: "search_queries"

  # Defines the route for the "about" page
  resources :users, only: [:index, :create]
  resources :search_queries, only: [:index, :create]
  #Ex:- :default =>''

  mount ActiveAnalytics::Engine, at: 'analytics'



end
