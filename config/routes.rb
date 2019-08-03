Rails.application.routes.draw do
  resources :newsletters
  resources :guestorders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users
resources :soaps
resources :carts
resources :charges
resources :orders
post '/login', to: 'auth#create'
get '/auto_login', to: 'auth#auto_login'
end
