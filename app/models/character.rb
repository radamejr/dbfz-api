class Character < ApplicationRecord

  has_many :normals, dependent: :destroy
end
