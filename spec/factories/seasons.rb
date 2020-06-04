FactoryBot.define do
  factory :season, class: 'Season' do
    number { Faker::Number.number(digits: 2) }
  end
end