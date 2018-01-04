
  15.times do
  user = User.create(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "1234",
    birth_date: Faker::Date.birthday(18, 65)
    )
  end

# User.all.each do |u|
#   u.created_at = Faker::Date.birthday(1, 5)
# end



# START CATEGORY
Category.destroy_all

categories = []
20.times do
  categories << Faker::Name.title.split(" ")[0]
end

def make
  [true,false].sample
end

categories.uniq.each do |category|
  a = make
  Category.create(
    name: "#{category}#{" Marketplace" if a}",
    market: a,
    description: Faker::HitchhikersGuideToTheGalaxy.marvin_quote * 5
  )
end
# END CATEGORY

Category.all.each do |cate|
  rand(10..40).times do
    Post.create!(
      content: Faker::HitchhikersGuideToTheGalaxy.marvin_quote * 3,
      post_type: ["text","url"].sample,
      title: Faker::HitchhikersGuideToTheGalaxy.specie,
      link: "http://www.google.com",
      category_id: cate.id,
      user_id: User.all.sample.id
    )
  end
end


Post.all.each do |post|
  10.times do
    Comment.create!(
      content: Faker::HitchhikersGuideToTheGalaxy.quote,
      user: User.all.sample,
      post: post
    )
  end
end

Post.all.each do |post|
  rand(1..20).times do
    Like.create!(
      user: User.all.sample,
      post: post
    )
  end
end
