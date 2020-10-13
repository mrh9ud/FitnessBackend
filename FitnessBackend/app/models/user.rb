class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    validates :username, presence: true
    validates :username, length: { in: 4..12 }
    validates :password, presence: true, on: :create
end
