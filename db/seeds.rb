# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  email = "#{name.underscore.delete(' ')}@gmail.com"
  user = User.create(
    name: name,
    email: email
  )

  rand(1..3).times do
    user.posts.create(
      image_url: "https://picsum.photos/id/#{rand(300)}/300",
      description: Faker::Lorem.sentence,
    )
  end
end

Post.all.each do |post|
  rand(3..5).times do
    users_count = User.count
    user = User.find(rand(1..users_count))
    post.comments.create(
      user: user,
      content: Faker::Lorem.sentence,
    )
  end
end
