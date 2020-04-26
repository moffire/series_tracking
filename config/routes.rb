Rails.application.routes.draw do
  devise_for :users
  root 'landing#index'
  get 'search', to: 'search#movies', as: 'search'
  get 'movie/:id', to: 'movie_info#show', as: 'movie_info'
end
