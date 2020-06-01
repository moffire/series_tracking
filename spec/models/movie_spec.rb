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
    it 'default value of image link should presence' do
      movie = Movie.new
      movie.valid?
      expect(movie.image_url).to eq('https://dummyimage.com/600x400/f5f5f5/000000&text=No+image+=(')
    end
    it 'should setup external image link' do
      movie = Movie.new(image_url: 'external link')
      movie.valid?
      expect(movie.image_url).to eq('external link')
    end
    it 'default value of description should presence' do
      movie = Movie.new
      movie.valid?
      expect(movie.description).to eq('Описание недоступно')
    end
    it 'should setup external description' do
      movie = Movie.new(description: 'lorem ipsum')
      movie.valid?
      expect(movie.description).to eq('lorem ipsum')
    end
  end
end
