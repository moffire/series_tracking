Rails.application.routes.draw do
  devise_for :users
  root 'landing#index'
  get 'search', to: 'search#movies', as: 'search'
end
