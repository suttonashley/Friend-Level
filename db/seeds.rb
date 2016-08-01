# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create(
  username: 'graham',
  password: 'password',
  password_confirmation: 'password'
)

user2 = User.create(
  username: 'ashley',
  password: 'password',
  password_confirmation: 'password'
)

10.times do
  User.create(username: Faker::Internet.user_name, password: "password", password_confirmation: "password")
end


Friendship.request(user1, user2)
