class MovieInfoController < ApplicationController
  def show
    # query = params[:id]
    # @movie = MyShows.new.movie_info(query)
    show = MyShows.new(22410)
    @movie = show.movie_info
    @series = show.episodes_list
  end
end
