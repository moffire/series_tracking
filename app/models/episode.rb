class Episode < ApplicationRecord
  validates :number, :title, presence: true
  belongs_to :season
end
