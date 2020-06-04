require 'rails_helper'

RSpec.describe Movie, type: :model do

  before(:example) do
    @movie = create(:movie)
    @subscriptions = @movie.subscriptions
    @seasons = @movie.seasons
    @episodes = @movie.episodes
  end

  context 'validation tests' do
    it { should validate_presence_of(:country) }
    it { should_not validate_presence_of(:start_date) }
    it 'default value of start date should presence' do
      expect(@movie.start_date).to eq('Неизвестно')
    end
    it { should validate_presence_of(:external_id) }
    it 'movie object should be valid' do
      expect(@movie.valid?).to eq(true)
    end
    it 'movie object should be invalid' do
      @movie.ru_title = nil
      @movie.en_title = nil
      @movie.valid?
      expect(@movie.errors.messages[:title]).to include('either one of ru_title or en_title must be presence')
    end
    it 'default value of image link should presence' do
      expect(@movie.image_url).to eq('https://dummyimage.com/600x400/f5f5f5/000000&text=No+image+=(')
    end
    it 'should setup external image link' do
      @movie.image_url = 'external link'
      expect(@movie.image_url).to eq('external link')
    end
    it 'default value of description should presence' do
      expect(@movie.description).to eq('Описание недоступно')
    end
    it 'should setup external description' do
      @movie.description = 'lorem ipsum'
      expect(@movie.description).to eq('lorem ipsum')
    end
  end

  context 'relation tests' do
    it { should have_many(:seasons) }
    it { should have_many(:episodes).through(:seasons) }
    it { should have_many(:subscriptions) }
    it { should have_many(:viewed_episodes) }
    it 'should have related subscriptions' do
      expect(@subscriptions.count).to eq(2)
    end
    it 'should have related seasons' do
      expect(@seasons.count).to eq(2)
    end
    it 'should have related episodes' do
      expect(@episodes.count).to eq(4)
    end
  end
end
