class LandingController < ApplicationController
  def index
    @top_movies = MyShows.new.top_rated
  end
end
