class Movie < ApplicationRecord
  validates :image_url, :description, :country, :start_date, presence: true
  has_many :seasons
end
