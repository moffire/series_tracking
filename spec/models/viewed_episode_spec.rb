require 'rails_helper'

RSpec.describe ViewedEpisode, type: :model do
  context 'validation tests' do
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:episode_id) }
    it { should validate_presence_of(:season_id) }
    it { should validate_uniqueness_of(:episode_id).scoped_to(:user_id) }
  end

  context 'relation tests' do
    it { should belong_to(:episode) }
    it { should belong_to(:user) }
  end
  
  context 'callback tests' do
    # write after addition Factory
  end
end
