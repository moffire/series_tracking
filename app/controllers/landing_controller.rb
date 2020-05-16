class LandingController < ApplicationController
  def index
    @top_movies = Movie.all.order(imdb: :desc, kinopoisk: :desc).limit(8)
  end

  def top_imdb
    @top_movies = Movie.all.order(imdb: :desc).limit(8)
    render 'landing/index'
  end

  def top_kinopoisk
    @top_movies = Movie.all.order(kinopoisk: :desc).limit(8)
    render 'landing/index'
  end
end
