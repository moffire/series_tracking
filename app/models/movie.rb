class Movie < ApplicationRecord
  validates :image_url, :description, :country, :start_date, :external_id, presence: true
  has_many :seasons

  before_validation do |record|
    record.external_id = movie_attr[:external_id]
    record.ru_title = movie_attr[:movie_ru_title]
    record.en_title = movie_attr[:movie_en_title]
    record.image_url ||= movie_attr[:movie_image]
    record.description ||= movie_attr[:description]
    record.start_date = movie_attr[:start_date]
    record.country = movie_attr[:country]
    record.imdb = movie_attr[:imdb]
    record.kinopoisk = movie_attr[:kinopoisk]
  end

  private

  def movie_attr
    MyShows.new(attributes['external_id']).movie_info
  end

end
