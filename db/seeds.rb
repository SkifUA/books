# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
summary = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
genres = [
    'Detective',
    'Science fiction',
    'Drama',
    'Comedy',
    'Thriller'
]

user = User.create!(
    email: "admin@test.com",
    password: "asdfasdf",
    password_confirmation: "asdfasdf",
    name: "Admin User",
    admin: true
)
puts "Admin user created"

user1 = User.create!(
    email: "test1@test.com",
    password: "asdfasdf",
    password_confirmation: "asdfasdf",
    name: "Test1 User",
    admin: false
)
puts "Test1 user created"

user2 = User.create!(
    email: "test2@test.com",
    password: "asdfasdf",
    password_confirmation: "asdfasdf",
    name: "Test2 User",
    admin: false
)
puts "Test2 user created"

user3 = User.create!(
    email: "test3@test.com",
    password: "asdfasdf",
    password_confirmation: "asdfasdf",
    name: "Test3 User",
    admin: false
)
puts "Test3 user created"


genres.each do |g|
  Genre.create!(name: g)
end
puts "#{genres.count} genres created"


8.times do |book|
  Book.create!(
      title: "Book#{book} User1",
      author: "Author#{book}",
      user: user1,
      summary: summary,
      genre_ids: [1, 5]
  )
end
puts "8 books user1 created"

8.times do |book|
  Book.create!(
      title: "Book#{book} User2",
      author: "Author#{book}",
      user: user2,
      summary: summary,
      genre_ids: [2, 4]
  )
end
puts "8 books User2 created"

8.times do |book|
  Book.create!(
      title: "Book#{book} user3",
      author: "Author#{book}",
      user: user3,
      summary: summary,
      genre_ids: [1, 4]
  )
end
puts "8 books User3 created"
