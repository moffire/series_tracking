require 'rails_helper'

RSpec.describe Subscription, type: :model do
  context 'relation tests' do
    it { should belong_to(:user) }
    it { should belong_to(:movie) }
    it { should have_many(:seasons).through(:movie) }
    it { should have_many(:episodes).through(:movie) }
    it { should have_many(:viewed_episodes).through(:movie) }
  end
end
