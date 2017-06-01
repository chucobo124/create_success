class Product < ApplicationRecord
  has_many :pictures, as: :imageable
  has_many :standard_accessories, class_name: 'Product',
    foreign_key: 'standard_accessorie_id'
  has_many :optional_accessories, class_name: 'Product',
    foreign_key: 'optional_accessorie_id'
  has_one :product_spec
end
