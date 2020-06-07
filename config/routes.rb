Rails.application.routes.draw do
  devise_for :users
  root 'landing#index'

  # header links
  get 'search', to: 'search#search_movies', as: 'search'
  get 'top_imdb', to: 'landing#top_imdb', as: 'top_imdb'
  get 'top_kp', to: 'landing#top_kinopoisk', as: 'top_kp'

  # main content links
  get 'movie/:id', to: 'movie_info#movie', as: 'movie'
  get 'subscribe/:id', to: 'subscriptions#subscribe', as: 'subscribe'
  get 'unsubscribe/:id', to: 'subscriptions#unsubscribe', as: 'unsubscribe'

  # update episode status (viewed/unviewed)
  put 'movie/update_status/:id', to: 'movie_info#change_view_status', as: 'update_status'

  # profile
  get 'profile/:id', to: 'profile#index', as: 'profile'

  # api
  
  resources :users do
    member do
      get 'api_token', to: 'users#api_token'
    end
  end
  
  namespace :api do
    namespace :v1 do
      resources :movie_info, only: [:create, :update, :destroy]
      get 'top_imdb', to: 'movie_info#top_rated_imdb'
      get 'top_kp', to: 'movie_info#top_rated_kp'
    end
  end
end
