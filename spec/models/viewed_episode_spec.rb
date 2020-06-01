require 'rails_helper'

RSpec.describe ViewedEpisode, type: :model do
  context 'validation test' do
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:episode_id) }
    it { should validate_presence_of(:season_id) }
    it { should belong_to(:episode).class_name('Episode') }
    it { should belong_to(:user).class_name('User') }
    it { should validate_uniqueness_of(:episode_id).scoped_to(:user_id) }
  end
end
