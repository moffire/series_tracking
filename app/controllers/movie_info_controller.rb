class MovieInfoController < ApplicationController

  before_action :set_episode, only: :change_view_status
  before_action :authenticate_user!, only: :change_view_status

  def movie
    @movie = Movie.find_by_id(params[:id])
    redirect_to(root_path, notice: 'Фильм не найден') unless @movie
    @seasons = @movie.seasons
    @viewed_episodes = current_user.viewed_episodes.where(movie_id: @movie.id, viewed: true).pluck(:episode_id)
  end

  def change_view_status

    viewed_episode = current_user.viewed_episodes.find_by(episode_id: @episode)

    if viewed_episode
      viewed_episode.toggle(:viewed).save
    else
      current_user.viewed_episodes.create(
        episode_id: @episode.id,
        season_id: @episode.season.id,
        movie_id: @episode.movie.id
      )
    end

    respond_to do |format|
      format.json { render json: @episode.movie }
    end

  end

  private

  def set_episode
    @episode = Episode.find_by_id(params[:id])
  end
end
