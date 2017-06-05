class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  mount_uploader :asset, PictureUploader if Picture.respond_to? 'mount_uploader'
end
