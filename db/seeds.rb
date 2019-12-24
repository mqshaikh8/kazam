# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Group.destroy_all
Connection.destroy_all
puts "creating"
10.times do
    puts "creating users 😀"
    User.create(name:Faker::Name.name,age: Faker::Number.number(digits: 2),password:Faker::Number.number(digits: 5))
    puts "creating group 🏀"
    Group.create(name:Faker::Name.name,description: Faker::Lorem.words)
    puts "creating association ☪️"
    Connection.create(user: User.all.sample,group:Group.all.sample)
    Post.create(user:User.all.sample,group:Group.all.sample,title:Faker::Lorem.words,content:Faker::Number.number(digits: 5))
    puts "done😀😀"
end

