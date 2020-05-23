class Movie < ApplicationRecord
  validates :image_url, :description, :country, :start_date, :external_id, presence: true
  has_many :seasons, dependent: :destroy
  has_many :episodes, through: :seasons, dependent: :destroy
  has_many :subscriptions
  has_many :viewed_episodes, dependent: :destroy
  before_validation :set_date


  def self.from_external_data(data)

    movie = Movie.find_or_initialize_by(external_id: data[:external_id])
    if movie.new_record?
      movie.ru_title = data[:movie_ru_title]
      movie.en_title = data[:movie_en_title]
      movie.image_url = data[:movie_image]
      movie.description = data[:description]
      movie.start_date = data[:start_date]
      movie.country = data[:country]
      movie.imdb = data[:imdb]
      movie.kinopoisk = data[:kinopoisk]
      return nil unless movie.save
    end

    data[:seasons].keys.each do |season|
      Season.from_external_data(movie.id, season, data[:seasons])
    end

    movie
  end

  def self.update_subscriptions_movies
    movies_for_update = []
    Subscription.all.each do |subscription|
      movies_for_update << subscription.movie.external_id
    end
    movies_for_update.uniq.each do |movie|
      Movie.from_external_data(MyShows.new(movie).movie_info)
    end
  end

  private

  def set_date
    self.start_date ||= 'Неизвестно'
  end

end
