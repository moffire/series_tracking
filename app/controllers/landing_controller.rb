class LandingController < ApplicationController
  before_action :set_subscriptions
  
  def index
    @top_movies = Movie.all.paginate(page: params[:page], per_page: 12)
  end
  
  def top_imdb
    movies_list = $redis.get('top_movies_imdb')
    unless movies_list
      movies_list = Movie.all.order(imdb: :desc).limit(12).to_json
      $redis.set('top_movies_imdb', movies_list)
      $redis.expire('top_movies_imdb', 10.hours.from_now.to_i)
    end
    @top_movies = JSON.load(movies_list).paginate(page: params[:page], per_page: 12)
    
    @subscriptions = current_user.subscriptions.map(&:movie_id) if user_signed_in?
    
    render 'landing/index'
  end
  
  def top_kinopoisk
    movies_list = $redis.get('top_movies_kp')
    unless movies_list
      movies_list = Movie.all.order(kp: :desc).limit(12).to_json
      $redis.set('top_movies_kp', movies_list)
      $redis.expire('top_movies_kp', 10.hours.from_now.to_i)
    end
    @top_movies = JSON.load(movies_list).paginate(page: params[:page], per_page: 12)
  
    @subscriptions = current_user.subscriptions.map(&:movie_id) if user_signed_in?
  
    render 'landing/index'
  end
  
  private
  
  def set_subscriptions
    @subscriptions = current_user.subscriptions.map(&:movie_id) if user_signed_in?
  end
end
