class User < ApplicationRecord
  has_secure_password

  has_many :likes
  has_many :comments
  has_many :posts
  has_many :categories, through: :posts

  validates :username, :email, presence: true, uniqueness: true
  validates :password, presence: true

  def liked_categories
    Post.all.select do |post|
      self.categories.include?(post.category)
    end
  end

end
