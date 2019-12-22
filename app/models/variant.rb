class Variant < ApplicationRecord
  belongs_to :special
  
  mount_base64_uploader :picture, PictureUploader
end
