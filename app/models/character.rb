class Character < ApplicationRecord

  has_many :normals, dependent: :destroy
  has_many :supers, dependent: :destroy
end
