class MovieInfoController < ApplicationController

  # это надо бы перенести в модель, но как потом
  # вызвать метод в контроллере?
  def full_info
    movie_data = MyShows.new(params[:external_id]).movie_info
    @movie = Movie.from_external_data(movie_data)
  end
end
