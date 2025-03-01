Rails.application.routes.draw do
  post '/register', to: 'auth#register'
  post '/login', to: 'auth#login'

  get '/profile', to: 'users#show'
  put '/profile', to: 'users#update'
  delete '/profile', to: 'users#destroy'

  resources :tasks
end
