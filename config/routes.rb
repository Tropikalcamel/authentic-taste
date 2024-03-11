Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  
  resources :restaurants
  resources :restaurants do
    resources :reviews
  end
  
  get 'profile', to: 'pages#profile', as: 'profile'
end
