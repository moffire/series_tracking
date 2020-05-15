class SubscriptionsController < ApplicationController
  before_action :movie, only: [:subscribe, :unsubscribe]

  def subscribe
    if current_user.subscriptions.exists?(movie_id: @movie.id)
      redirect_to root_path,
                  notice: "Вы уже подписаны на #{ @movie.ru_title }"
    else
      subscription = current_user.subscriptions.build(movie_id: @movie.id)
      subscription.save
      redirect_to movie_info_path(@movie.external_id),
                  notice: "Вы подписались на #{ @movie.ru_title }"
    end
  end

  def unsubscribe
    if current_user.subscriptions.exists?(movie_id: @movie.id)
      subscription = current_user.subscriptions.find_by(movie_id: @movie.id)
      subscription.destroy
      redirect_to root_path,
                  notice: "Вы отписались от #{ @movie.ru_title }"
    end
  end

  private

  def movie
    @movie = Movie.find_by(external_id: params[:external_id])
    if @movie.nil?
      # это дублирует код из movie_info контроллера
      # надо перенести этот метод в модель, а лучше брать
      # информацию уже из БД, а не через парсер
      movie_data = MyShows.new(params[:external_id]).movie_info
      @movie = Movie.from_external_data(movie_data)
    end
  end
end
