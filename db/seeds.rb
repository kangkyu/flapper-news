# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create!([
    {
      email: "user@example.com",
      password: "password",
      username: "User Example"
    }
  ])
posts = Post.create!([
    {
      title: "I have a dream.",
      link: "http://www.ihaveadreamfoundation.org/",
      upvotes: 0,
      user: users.first
    }
  ])
