class Super < ApplicationRecord
  belongs_to :character
  has_many :super_variants, dependent: :destroy
  
  mount_base64_uploader :picture, PictureUploader
end
