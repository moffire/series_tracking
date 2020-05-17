class Season < ApplicationRecord
  validates :number, presence: true, numericality: { greater_than: 0 }
  belongs_to :movie
  has_many :episodes, dependent: :destroy
  has_many :viewed_episodes, dependent: :destroy

  def self.from_external_data(movie_id, season_number, seasons_data)
    season = Season.find_or_initialize_by(movie_id: movie_id,
                                      number: season_number.to_i)
    return nil unless season.save

    Episode.from_external_data(movie_id, season.id, seasons_data[season_number])
  end

end
