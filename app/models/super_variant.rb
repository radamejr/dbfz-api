class SuperVariant < ApplicationRecord
    belongs_to :super
  
    mount_base64_uploader :picture, PictureUploader
end
