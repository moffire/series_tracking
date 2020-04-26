class MovieInfoController < ApplicationController
  def show
    # query = params[:id]
    # @movie = MyShows.new.movie_info(query)
    @movie = MyShows.new.movie_info(22410)
  end
end
