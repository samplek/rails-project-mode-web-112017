class User < ApplicationRecord
  has_secure_password

  has_many :likes
  has_many :comments
  has_many :posts
  has_many :categories, through: :posts
end
