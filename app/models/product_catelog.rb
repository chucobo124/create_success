class ProductCatelog < ApplicationRecord
  mount_uploader :file_path, FileUploader if ProductCatelog.respond_to? 'mount_uploader'
end
