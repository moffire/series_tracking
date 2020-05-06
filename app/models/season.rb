class Season < ApplicationRecord
  validates :number, presence: true, numericality: { greater_than: 0 }
  belongs_to :movie
  has_many :episodes, dependent: :destroy

  # before_validation do |season_info|
  #   data = season_data
  #   data.each do |season, episode|
  #     season_info.movie_id = Movie.last.id
  #     season_info.number = season
  #   end
  # end


  def season_data
    MyShows.new.seasons_list(Movie.last[:external_id])
  end

end
