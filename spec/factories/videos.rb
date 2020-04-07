FactoryBot.define do
  factory :video do
    title { Faker::Name.name }
    external_id  { Faker::Number.number(digits: 10) }
  end
end
