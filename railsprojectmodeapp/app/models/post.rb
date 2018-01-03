class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :likes
  has_many :comments

  def post_time
    "on #{self.created_at.strftime("%b %d, %Y")}"
    "edited on #{self.updates_at.strftime("%b %d, %Y")}" if self.updated_at > self.created_at
  end

end
