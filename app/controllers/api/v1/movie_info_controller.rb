class Api::V1::MovieInfoController < ApplicationController
  
  def top_rated_imdb
    @top_movies = Movie.all.order(imdb: :desc).limit(10)
    render 'movie_info/api/v1/top_rated_imdb', status: 200
  end
  
  def top_rated_kp
    @top_movies = Movie.all.order(kinopoisk: :desc).limit(10)
    render 'movie_info/api/v1/top_rated_kp', status: 200
  end
  
end