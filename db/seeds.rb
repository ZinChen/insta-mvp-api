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
  photo = User.create_photo

  user = User.create(
    name: name,
    email: email,
    photo: photo,
  )

  rand(1..3).times do
    user.posts.create(
      image_url: "https://picsum.photos/id/#{rand(1..100)}/1000",
      description: Faker::Lorem.sentence(word_count: rand(10..15)),
    )
  end
end

Post.all.each do |post|
  rand(1..5).times do
    users_count = User.count
    user = User.find(rand(1..users_count))
    post.comments.create(
      user: user,
      content: Faker::Lorem.sentence(word_count: rand(5..15)),
    )
  end

  rand(1..5).times do
    users_count = User.count
    user = User.find(rand(1..users_count))

    post.likes.create(user: user)
  end
end
