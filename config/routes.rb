Rails.application.routes.draw do
  resources :feedbacks
  resources :contacts
  resources :newsletters
  resources :guestorders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users
resources :soaps
resources :carts
resources :charges
resources :orders
post '/oauth', to: 'social#create'
post '/login', to: 'auth#create'
get '/auto_login', to: 'auth#auto_login'
post '/verify', to: 'password_resets#verify'
end
