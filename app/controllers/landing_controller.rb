class LandingController < ApplicationController
  def index
    @top_movies = Movie.all.order(imdb: :desc).limit(8)
  end
end
