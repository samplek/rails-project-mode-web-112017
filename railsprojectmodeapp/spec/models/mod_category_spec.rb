require 'rails_helper'

valid_user = User.create(
  username: 'marvin',
  password: '123',
  email: 'marvin@mail',
  image: 'alligator',
  color: 'red',
)

invalid_user = User.create(
  username: 'marvin2',
  email: 'marvin@mail2',
)

valid_category = Category.create(
  name: 'Category',
  description: 'DESC',
  market: true
)

invalid_category = Category.create(
  name: 'Category',
  description: 'DESC',
  market: true
)

valid_post = Post.create(
  title: 'Title',
  content: 'content',
  user: User.all.sample,
  category: Category.all.sample,
)

invalid_post = Post.create(
  title: 'Title',
  content: 'content',
)

valid_comment = Comment.create(
  content: "CONTENT",
  user: User.all.sample,
  post: Post.all.sample
)

invalid_comment = Comment.create(
  user: User.all.sample,
  post: Post.all.sample
)



 #USER
describe 'Valid User', type: :model do
  it 'is a vaild user' do
    expect(valid_user.valid?).to eq(true)
  end

  it 'return the proper image path' do
    expect(valid_user.image_link).to eq("alligator/red.png")
  end
end

describe 'Invalid User', type: :model do
  User.destroy_all
  it "user cannot be created without password" do
  expect(invalid_user.valid?).to eq(false)

  end
end

#POST
describe 'Valid Post', :type => :feature do
  it 'is a valid post' do
    expect(valid_post.valid?).to eq(true)
  end

  it 'returns time as string' do
    expect(valid_post.post_time).to be_instance_of(String)
  end
end

describe 'Invalid Post', :type => :feature do
  it 'is invalid' do
    expect(invalid_post.valid?).to eq(false)
  end
end

#Category
describe 'Valid Category', :type => :feature do
  it 'is a valid category' do
    expect(valid_category.valid?).to eq(true)
  end
end

describe 'Invalid Category', :type => :feature do
  it 'is invalid' do
    expect(invalid_category.valid?).to eq(false)
  end
end

#Comment
describe 'Valid Comment', :type => :feature do
  it 'is a valid comment' do
    expect(valid_comment.valid?).to eq(true)
  end
end

describe 'Invalid Comment', :type => :feature do
  it 'is invalid' do
    expect(invalid_comment.valid?).to eq(false)
  end
end
