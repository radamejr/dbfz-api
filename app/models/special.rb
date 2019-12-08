class Special < ApplicationRecord
    belongs_to :character
    mount_base64_uploader :picture, PictureUploader
end
