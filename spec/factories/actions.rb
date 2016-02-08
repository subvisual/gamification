FactoryGirl.define do
  factory :action do
    name { Faker::Name.name }
    slug { Faker::Name.name.to_sym }
    points 0
  end
end
