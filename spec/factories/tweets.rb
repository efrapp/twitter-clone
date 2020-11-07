FactoryBot.define do
  factory :tweet do
    message { Faker::Lorem.paragraph }
    user
  end
end
