FactoryBot.define do
  factory :episode, class: 'Episode' do
    number { Faker::Number.number(digits: 1) }
    title { Faker::Movie.quote }
    date { '13.12.2005' }
  end
end