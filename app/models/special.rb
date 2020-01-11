class Special < ApplicationRecord
    belongs_to :character
    has_many :special_variants, dependent: :destroy
    
    mount_base64_uploader :picture, PictureUploader
end
