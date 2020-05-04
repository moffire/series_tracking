Rails.application.routes.draw do
  devise_for :users
  root 'landing#index'
  get 'search', to: 'search#movies', as: 'search'
  get 'movie/:external_id', to: 'movie_info#full_info', as: 'movie_info'
end
