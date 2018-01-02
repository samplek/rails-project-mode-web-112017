

# 15.times do
#   User.create(username: Faker::Name.name, email: Faker::Internet.email, password: "1234", birth_date: Faker::Date.birthday(18, 65))
# end
#
# 5.times do
#   Category.create(name: Faker::Name.title, market: false)
# end
#
#
# User.all.each do |user|
#   3.times do
#     Post.create!(content: Faker::HitchhikersGuideToTheGalaxy.marvin_quote, post_type: "text", title: Faker::HitchhikersGuideToTheGalaxy.specie, link: "http://www.google.com", category_id: Category.all.sample.id, user_id: user.id)
#   end
# end

Post.all.each do |post|
  10.times do
    Comment.create!(
      content: Faker::HitchhikersGuideToTheGalaxy.quote,
      user: User.all.sample,
      post: post
    )
  end
end
