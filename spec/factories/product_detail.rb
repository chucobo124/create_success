FactoryGirl.define do
  factory :product_detail do
    maximum_diameter_grab_items Faker::Commerce.product_name
  end
end
