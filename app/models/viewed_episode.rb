class ViewedEpisode < ApplicationRecord
  belongs_to :user
  belongs_to :episode
  validates :movie_id, presence: true
  validates :episode_id, presence: true
  validates :season_id, presence: true
  validates_uniqueness_of :episode_id, scope: :user_id
  before_create :set_status


  private

  def set_status
    self.viewed = true
  end

end
