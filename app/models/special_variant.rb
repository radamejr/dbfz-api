class SpecialVariant < ApplicationRecord
  belongs_to :special
  
  mount_base64_uploader :picture, PictureUploader
end
