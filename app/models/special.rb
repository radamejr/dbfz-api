class Special < ApplicationRecord
    belongs_to :character
    has_many :variants, dependent: :destroy
    
    mount_base64_uploader :picture, PictureUploader
end
