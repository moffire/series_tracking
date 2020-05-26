class MovieInfoController < ApplicationController

  before_action :set_episode, only: :view_status

  def movie
    @movie = Movie.find_by_id(params[:id])
    redirect_to(root_path, notice: 'Фильм не найден') unless @movie
    @viewed_episodes = current_user.viewed_episodes.where(movie_id: @movie.id).pluck(:episode_id)
  end

  def view_status
    # render 'movie_info/movie'
  end

  private

  def set_episode
    @episode = Episode.find_by_id(params[:id])
  end
end
