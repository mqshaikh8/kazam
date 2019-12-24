Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: "users#portal", :as => 'portal'
  get '/signup', to: "users#signup", :as => 'signup'
  get '/login', to: "users#login", :as => 'login'
  post '/loginverifier', to: "users#loginverifier", :as => 'verifier'
  post '/groups/:id', to: "groups#connection"

  
  resources :users
  resources :groups
end
