class Category < ApplicationRecord
  has_many :posts
  has_many :user_categories
  has_many :users, through: :user_categories




  def page_counter
    self.posts.each_slice(10).map do |posts|
      posts.map do |post|
        post.id
      end
    end
  end



end
