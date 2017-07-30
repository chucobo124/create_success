class ProductCatelog < ApplicationRecord
  validates :file_path, presence: true
  has_many :pictures, as: :imageable
  mount_uploader :file_path, FileUploader if ProductCatelog.respond_to? 'mount_uploader'
end
