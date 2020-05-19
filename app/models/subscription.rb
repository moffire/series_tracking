class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :seasons, through: :movie
  has_many :episodes, through: :movie
  has_many :viewed_episodes, through: :movie
end
