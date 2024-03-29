class User < ApplicationRecord
    has_many :tasks

    validates :name, presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 255 }, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    has_secure_password
    validates :password, length: { in: 6..255 }
end
