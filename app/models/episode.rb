class Episode < ApplicationRecord
  validates :number, :title, presence: true
  belongs_to :season
  belongs_to :movie
end
