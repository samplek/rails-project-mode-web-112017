class User < ApplicationRecord
  has_secure_password

  has_many :likes
  has_many :comments
  has_many :posts
  has_many :user_categories
  has_many :categories, through: :user_categories

  validates :username, :email, presence: true, uniqueness: true
  validates :password, presence: true

  def liked_categories
    Post.all.select do |post|
      self.categories.include?(post.category)
    end
  end


  def posts_count
    self.posts.count
  end

  def likes_count
    self.likes.count
  end

  def comments_count
    self.comments.count
  end

  def member_since
    join_date = (((Time.now - self.created_at)/3600)/24)

    if join_date <= 1
      "Member for 1 day"
    else
      "Member for #{join_date.floor} days"
    end
  end

end
