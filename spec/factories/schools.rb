FactoryBot.define do
  factory :school do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
  end
end
