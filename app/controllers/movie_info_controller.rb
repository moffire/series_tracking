class MovieInfoController < ApplicationController

  def full_info
    movie_data = MyShows.new(params[:external_id]).movie_info
    @movie = Movie.from_external_data(movie_data)
  end
end
