require 'rails_helper'

RSpec.describe Movie, type: :model do
  context 'validation test' do
    it { should validate_presence_of(:country) }
    it { should_not validate_presence_of(:start_date) }
    it 'default value of start date should presence' do
      movie = Movie.new
      movie.valid?
      movie.start_date.should eq('Неизвестно')
    end
    it { should validate_presence_of(:external_id) }
    it 'movie object must be valid' do
      movie = Movie.new(ru_title: 'Ru-Title',
                        country: 'Country',
                        start_date: '22.06.2020',
                        external_id: 12345)
      expect(movie.valid?).to eq(true)
    end
    it 'movie object must be invalid' do
      movie = Movie.new(ru_title: nil,
                        en_title: nil,
                        country: 'Country',
                        start_date: '22.06.2020',
                        external_id: 12345)
      movie.valid?
      expect(movie.errors.messages[:title]).to include('either one of ru_title or en_title must be presence')
    end
  end
end
