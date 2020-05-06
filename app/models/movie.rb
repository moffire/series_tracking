class Movie < ApplicationRecord
  validates :image_url, :description, :country, :start_date, :external_id, presence: true
  has_many :seasons, dependent: :destroy
  has_many :episodes, through: :seasons, dependent: :destroy

  before_validation do |movie|
    data = movie_data
    movie.external_id = data[:external_id]
    movie.ru_title = data[:movie_ru_title]
    movie.en_title = data[:movie_en_title]
    movie.image_url = data[:movie_image]
    movie.description = data[:description]
    movie.start_date = data[:start_date]
    movie.country = data[:country]
    movie.imdb = data[:imdb]
    movie.kinopoisk = data[:kinopoisk]
  end

  private

  def movie_data
    MyShows.new(attributes['external_id']).movie_info
  end
end
