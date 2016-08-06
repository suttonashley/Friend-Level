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

user3 = User.create(
  username: 'andrea',
  password: 'password',
  password_confirmation: 'password'
)

user4 = User.create(
  username: 'steve',
  password: 'password',
  password_confirmation: 'password'
)

user5 = User.create(
  username: 'frank',
  password: 'password',
  password_confirmation: 'password'
)

user6 = User.create(
  username: 'salomon',
  password: 'password',
  password_confirmation: 'password'
)

10.times do
  User.create(username: Faker::Internet.user_name, password: "password", password_confirmation: "password")
end



Friendship.request(user1, user2)
Friendship.request(user1, user3)
Friendship.request(user1, user4)
Friendship.request(user1, user5)
