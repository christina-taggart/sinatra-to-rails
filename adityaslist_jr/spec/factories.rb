FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "category#{n}" }
  end

  factory :post do
    sequence(:title) { |n| "title#{n}" }
    category
  end

end