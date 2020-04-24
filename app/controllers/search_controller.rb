class SearchController < ApplicationController
  def movies
    query = params[:q]
    @movies = MyShows.new(query).movies_list
  end
end