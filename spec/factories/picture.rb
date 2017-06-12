FactoryGirl.define do
  factory :picture do
    asset Faker::Commerce.product_name
  end
end
