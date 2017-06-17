def html_example
  '<div>
    <h1>Example Domain</h1>
    <p>This domain is established to be used for illustrative examples in documents. You may use this
    domain in examples without prior coordination or asking for permission.</p>
    <p><a href="http://www.iana.org/domains/example">More information...</a></p>
  </div>'
end

FactoryGirl.define do
  factory :product do
    name Faker::Commerce.product_name
    sku Faker::Number.number(10)
    description html_example
  end
end
