Rails.application.routes.draw do
  devise_for :users
  root 'landing#index'
  get 'search', to: 'search#movies', as: 'search'
  get 'movie/:external_id', to: 'movie_info#full_info', as: 'movie_info'
  get 'subscription/:external_id', to: 'subscriptions#subscribe', as: 'subscribe'
  get 'subscription/:external_id', to: 'subscriptions#unsubscribe', as: 'unsubscribe'
end
