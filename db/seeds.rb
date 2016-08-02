# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: "user@example.com", password: "password")
cheese = Cheese.create!(name: "Brie", user: user)
UserCheese.create!(user: user, cheese: cheese)

cheeses = ["Provolone", "Cheddar", "Feta", "Gorgonzola", "Gouda", "Munster"]
cheeses.each do |cheez|
  Cheese.create!(name: cheez, user: user)
end

User.create!(email: "steve@dave.com", password: "stevedave")
