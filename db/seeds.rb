# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


alex = User.create!(username: "alexandre", password: "alexandre", email: "alex@gmail.com", admin: true)
user2 = User.create!(username: "azertyui", password: "azertyui", email: "azertyui@gmail.com")


tweet1 = Tweet.create!(user: alex, message: "hello")
tweet2 = Tweet.create!(user: user2, message: "hi")
tweet3 = Tweet.create!(user: user2, message: "world")