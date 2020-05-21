class Episode < ApplicationRecord
  validates :number, :title, presence: true
  belongs_to :season
  belongs_to :movie

  def self.from_external_data(movie_id, season_id, episodes_data)
    episodes_data.each do |episode_number, data|
      episode = Episode.find_or_initialize_by(movie_id: movie_id,
                                              season_id: season_id,
                                              number: episode_number,
                                              title: data[:episode_title],
                                              date: data[:episode_date])
      if episode.new_record?
        return nil unless episode.save
      end
    end
  end
end
