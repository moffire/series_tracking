class MovieInfoController < ApplicationController

  def index
    # @movie = movie.movie_info
    # @movie = Movie.find_by()
    @seasons = movie.seasons_list
  end

  private

  def movie
    MyShows.new(params[:id])
  end
end
