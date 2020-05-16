class MovieInfoController < ApplicationController

  def movie
    @movie = Movie.find_by_id(params[:id])
    redirect_to(root_path, notice: 'Фильм не найден') unless @movie
  end
end
