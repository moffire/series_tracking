class LandingController < ApplicationController
  def index
    @top_movies = Movie.all.paginate(page: params[:page], per_page: 12)
  end

  def top_imdb
    @top_movies = Movie.all.order(imdb: :desc).paginate(page: params[:page], per_page: 12)
    render 'landing/index'
  end

  def top_kinopoisk
    @top_movies = Movie.all.order(kinopoisk: :desc).paginate(page: params[:page], per_page: 12)
    render 'landing/index'
  end
end
