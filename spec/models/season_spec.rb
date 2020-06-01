require 'rails_helper'

RSpec.describe Season, type: :model do
  context 'validation test' do
    it { should validate_presence_of(:number) }
    it 'object must be invalid with season number less then 0' do
      season = Season.new(number: -4)
      expect(season.valid?).to eq(false)
    end
  end
end
