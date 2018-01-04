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

  def likes_count
    if self.likes.count == 0
      "no likes"
    elsif self.likes_count == 1
      "1 like"
    elsif self.likes_count > 1
      "#{self.likes_count} likes"
    end
  end

  def comments_count
    if self.comments.count == 0
      "no comments"
    elsif self.comments_count == 1
      "1 comment"
    elsif self.comments_count > 1
      "#{self.comments_count} likes"
    end
  end

  def like_comments
    string = ""

    if self.likes_count == 1
      string += "1 like "
    elsif self.likes_count > 1
      string += "#{self.likes_count} likes "
    end

    string += "| " if self.likes_count >= 1 && self.comments_count >= 1

    if self.comments_count == 1
      string += "1 comment "
    elsif self.comments_count > 1
      string += "#{self.comments_count} comments "
    end

    string
  end

end
