# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'


25.times do |_i|
    SearchQuery.create(query: Faker::Book.title,
    
    count: Faker::Number.within(range: 1..100),
    user_id: 1
)
end

User.create(email: "hammali99@gmail.com", password: "123456", name: "Hamid")

