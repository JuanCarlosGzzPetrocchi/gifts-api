FactoryBot.define do
  factory :recipient do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
  end
end
