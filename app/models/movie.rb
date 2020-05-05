class Movie < ApplicationRecord
  validates :image_url, :description, :country, :start_date, :external_id, presence: true
  belongs_to :user
  has_many :seasons, dependent: :destroy
  has_many :episodes, through: :seasons, dependent: :destroy

  before_validation do |record|
    data = movie_data
    record.external_id = data[:external_id]
    record.ru_title = data[:movie_ru_title]
    record.en_title = data[:movie_en_title]
    record.image_url ||= data[:movie_image]
    record.description ||= data[:description]
    record.start_date = data[:start_date]
    record.country = data[:country]
    record.imdb = data[:imdb]
    record.kinopoisk = data[:kinopoisk]
  end

  private

  def movie_data
    MyShows.new(attributes['external_id']).movie_info
  end

end
