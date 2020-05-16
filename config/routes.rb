Rails.application.routes.draw do
  devise_for :users
  root 'landing#index'
  get 'search', to: 'search#search_movies', as: 'search'
  get 'movie/:id', to: 'movie_info#movie', as: 'movie'
  get 'subscribe/:id', to: 'subscriptions#subscribe', as: 'subscribe'
  get 'unsubscribe/:id', to: 'subscriptions#unsubscribe', as: 'unsubscribe'
end
