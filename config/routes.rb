Rails.application.routes.draw do
  namespace :api do
    post 'login', to: 'auth#login'
    post 'register', to: 'auth#register'
    get 'current_user', to: 'users#show' # New route to fetch logged-in user
    resources :tasks
  end
end
