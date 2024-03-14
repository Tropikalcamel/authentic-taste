Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :restaurants

  resources :restaurants do
    resources :reviews
  end
  get 'profile', to: 'pages#profile', as: 'profile'
  post 'users/:user_id/followers', to: "followers#create", as: :taster_follow
  delete 'users/:user_id/followers_destroy', to: "followers#destroy", as: :taster_destroy
  post 'users/:user_id/bookmarks', to: "bookmarks#create", as: :boomark_create
  delete 'restaurants/:restaurant_id/bookmark_destroy', to: "bookmarks#destroy", as: :boomark_delete

end
