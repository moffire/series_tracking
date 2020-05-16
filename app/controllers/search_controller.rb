class SearchController < ApplicationController
  def search_movies
    query = params[:q]
    # todo сделать нечувствительным к регистру
    @movies = Movie.where("ru_title ilike ?", "%#{query}%")
              .or(Movie.where("en_title ilike ?", "%#{query}%"))
  end
end