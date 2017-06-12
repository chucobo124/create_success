FactoryGirl.define do
  factory :product do
    name Faker::Commerce.product_name
    sku Faker::Number.number(10)
    description Examples.html_example
  end
end
