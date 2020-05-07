class Season < ApplicationRecord
  validates :number, presence: true, numericality: { greater_than: 0 }
  belongs_to :movie
  has_many :episodes, dependent: :destroy

  def self.from_external_data(movie_id, season_number, data)

    season = Season.find_or_create_by(movie_id: movie_id,
                                      number: season_number.to_i)
    return nil unless season.save

    data.each do |season_id, all_episodes_data|
      all_episodes_data.each do |episode_number, episode_data|
        Episode.from_external_data(season_id, episode_number, episode_data[:episode_title], episode_data[:episode_date])
      end
    end
  end
end
