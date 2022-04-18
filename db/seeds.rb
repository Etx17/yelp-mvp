require 'faker'

categories = %w[chinese italian japanese french belgian]

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
5.times do
  restaurant = Restaurant.new(
    name: "#{Faker::Name.name} 's Restaurant",
    address: Faker::Address.full_address,
    phone_number: Faker::Number.number(digits: 10),
    category: categories.sample
  )
  restaurant.valid?
  yum = Review.new(content: 'yummy yummy', rating: rand(5))
  yum.restaurant = restaurant
  yum.save
  restaurant.save
end
puts "Finished!"
