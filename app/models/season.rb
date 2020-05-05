class Season < ApplicationRecord
  validates :number, presence: true, numericality: { greater_than: 0 }
  belongs_to :movie
  has_many :episodes, dependent: :destroy
end
