class Character < ApplicationRecord
  has_many :normals, dependent: :destroy
  has_many :supers, dependent: :destroy
  has_many :specials, dependent: :destroy
  has_many :assists, dependent: :destroy

  mount_base64_uploader :icon, PictureUploader
  mount_base64_uploader :character_picture, PictureUploader
end
