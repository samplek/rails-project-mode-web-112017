class Category < ApplicationRecord
  has_many :posts, dependent: :delete_all
  has_many :user_categories, dependent: :delete_all
  has_many :users, through: :user_categories, dependent: :delete_all

  has_many :mod_categories, dependent: :delete_all

  validates :name, :description, presence: true
  validates :name, uniqueness: true



  def page_counter
    self.posts.each_slice(10).map do |posts|
      posts.map do |post|
        post.id
      end
    end
  end

  def self.top_catagories
    self.all.sort_by{|cate| cate.user_categories.count}.reverse
  end

  def self.top_user_catagories(logged_user)
    category = self.all.sort_by{ |cate| cate.user_categories.count }.reverse
    category.select{ |cate| cate.users.include?(logged_user) }
  end

  def self.normal_categories
    self.all.select {|cate| !cate.market}
  end

  def self.market_categories
    self.all.select {|cate| cate.market}
  end

end
