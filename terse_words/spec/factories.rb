FactoryGirl.define do
  factory :user do
    name { Faker::Lorem.word }
    email { Faker::Internet.email }
  end

  factory :url do
    long_url { Faker::Lorem.word }
    user
  end
end