class Api::V1::MovieInfoController < ApplicationController
  
  before_action :set_movie, only: [:movie, :all_movie_episodes, :season]
  
  def top_rated_imdb
    @top_movies = Movie.all.order(imdb: :desc).limit(10)
    render 'movie_info/api/v1/top_rated_imdb', status: 200
  end
  
  def top_rated_kp
    @top_movies = Movie.all.order(kinopoisk: :desc).limit(10)
    render 'movie_info/api/v1/top_rated_kp', status: 200
  end
  
  def movie
    if @movie
      render 'movie_info/api/v1/movie', status: 200
    else
      nonexistent_object
    end
  end

  def season
    @season = Season.where(number: params[:season_id], movie_id: @movie)
    if @season
      render 'movie_info/api/v1/season', status: 200
    else
      nonexistent_object
    end
  end
  
  def all_movie_episodes
    @episodes = Episode.where(movie_id: @movie)
    render 'movie_info/api/v1/episodes', status: 200
  end
  
  def episode
    @episode = Episode.find_by(id: params[:id])
    if @episode
      render 'movie_info/api/v1/episode', status: 200
    else
      nonexistent_object
    end
  end
  
  private
  
  def set_movie
    @movie = Movie.find_by_id(params[:id])
  end
  
  def nonexistent_object
    error = 'Объект не существует'
    render json: error.to_json, status: 404
  end

end