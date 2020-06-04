FactoryBot.define do
  factory :movie do
    external_id { Faker::Number.number(digits: 5) }
    ru_title { 'Кино' }
    en_title { Faker::Name.name }
    country { 'Russia' }
    after :create do |movie|
      create_list :season, 2, movie: movie
      movie.seasons.each do |season|
        create_list :episode, 2, { movie: movie, season: season }
      end
      create_list :subscription, 2, movie: movie
    end
  end
end