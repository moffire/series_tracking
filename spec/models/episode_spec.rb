require 'rails_helper'

RSpec.describe Episode, type: :model do
  context 'validation tests' do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:title) }
  end
  
  context 'relation tests' do
    it { should belong_to(:season) }
    it { should belong_to(:movie) }
  end
end
