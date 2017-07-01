class News < ApplicationRecord
  has_many :pictures, as: :imageable
end
