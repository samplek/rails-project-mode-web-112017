class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :likes
  has_many :comments
end
