class Movie < ApplicationRecord
  validates :image_url, :description, :country, :start_date, :external_id, presence: true
  has_many :seasons
end
