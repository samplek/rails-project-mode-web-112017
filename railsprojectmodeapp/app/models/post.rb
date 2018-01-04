class Post < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user
  has_many :likes
  has_many :comments

  validates :title,:category, presence: true

  def post_time
    if self.updated_at > self.created_at
      "edited on #{self.updated_at.strftime("%b %d, %Y")}" if self.updated_at > self.created_at
    else
      "posted on #{self.created_at.strftime("%b %d, %Y")}"
    end
  end

  def self.normal_posts
    self.all.select {|post| !post.category.market}
  end

  def self.market_posts
    self.all.select {|post| post.category.market}
  end

  def self.top_posts(arg)
    arg.sort_by{|x| x.likes.count}.reverse.take(4)
  end

  def summary
    if self.content.size > 150
      "#{self.content[0..150]} ..."
    else
      self.content
    end
  end

end
