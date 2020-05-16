class SubscriptionsController < ApplicationController
  before_action :find_movie, only: [:subscribe, :unsubscribe]

  def subscribe
    if current_user.subscriptions.exists?(movie_id: @movie.id)
      redirect_to root_path
    else
      subscription = current_user.subscriptions.build(movie_id: @movie.id)
      subscription.save
      redirect_back(fallback_location: root_path)
    end
  end

  def unsubscribe
    if current_user.subscriptions.exists?(movie_id: @movie.id)
      subscription = current_user.subscriptions.find_by(movie_id: @movie.id)
      subscription.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
    redirect_to root_path if @movie.nil?
  end
end
