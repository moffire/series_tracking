class Episode < ApplicationRecord
  validates :number, :title, presence: true
  belongs_to :season

  def self.from_external_data(season_id, episode_id, title, date)

    episode = Episode.find_or_initialize_by(season_id: season_id,
                                            number: episode_id,
                                            title: title,
                                            date: date)
    return nil unless episode.save

  end
end
