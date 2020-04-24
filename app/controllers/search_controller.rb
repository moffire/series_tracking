class SearchController < ApplicationController
  def movies
    @movies = params[:q]
  end
end
