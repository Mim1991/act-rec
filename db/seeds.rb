# This is where you can create initial data for your app.
# puts "Creating restaurants!"
# restaurant = Restaurant.new(name: "Five Guys", rating: 4, address: "London")
# restaurant.save
# puts "Created Restaurant 1"
# restaurant2 = Restaurant.new(name: "Sticks and Sushi", rating: 5, address: "London")
# restaurant2.save
# puts "Created Restaurant 2"
# puts "All done!"

require 'faker'

# puts "Creating Restaurants!"
# 100.times do |t|
#   restaurant = Restaurant.new(name: Faker::Restaurant.name, rating: rand(0..5), address: Faker::Address.street_name)
#   restaurant.save
#   puts "Created Restaurant #{t}"
# end
# puts "All done!"

require 'json'
require 'rest-client'

response = RestClient.get "https://api.github.com/users/lewagon/repos"
data = JSON.parse(response)

data.each do |repo|
  restaurant = Restaurant.new(name: repo["name"], rating: rand(0..5), address: Faker::Address.street_name)
  restaurant.save
end
