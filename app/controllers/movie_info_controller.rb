class MovieInfoController < ApplicationController

  def movie
    MyShows.new(movie_id)
  end

  def index
    @movie = movie.movie_info
    @episodes = movie.episodes_list
  end

  private

  def movie_id
    params[:id]
  end
end
