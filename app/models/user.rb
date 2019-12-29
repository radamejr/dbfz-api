class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: { minimum: 3 }
    validates :email, presence: true
    validates :email, uniqueness: true
    
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :password, length: { minimum: 6 }, :if => :password

end
