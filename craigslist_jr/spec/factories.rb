FactoryGirl.define do
  factory :category do
    sequence(:name){ |n| "Category#{n}" }
  end

  factory :post do
    sequence(:title) { |n| "My title #{n}" }
    sequence(:body) { |n| "My body #{n}" }
    category
    sequence(:secret_url){ |n| "abcd#{n}" }
  end
end