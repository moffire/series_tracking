class MovieInfoController < ApplicationController

  def full_info
    @movie = Movie.find_or_create_by(external_id: params[:external_id])
    # @seasons = Season.find_or_create_by(movie_id: @movie)
  end
end
