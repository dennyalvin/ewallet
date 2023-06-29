# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

user_category = %w[user team stock]

member = User.create(
        name: 'Denny Alfin',
        password: '123456',
        email: 'dennyalvin23@gmail.com',
        category: 'user',
        created_at: Time.now
    )

5.times do
    member = User.create(
        name: Faker::Name.unique.name_with_middle,
        password: '123456',
        email: Faker::Internet.unique.email,
        category: user_category.sample,
        created_at: Time.now
    )
end