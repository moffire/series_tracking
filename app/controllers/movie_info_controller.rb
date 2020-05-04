class MovieInfoController < ApplicationController

  def full_info
    # @movie = movie.movie_info
    @movie = Movie.find_or_create_by(external_id: params[:external_id])
    # @seasons = movie.seasons_list
  end
end
