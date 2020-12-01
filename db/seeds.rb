puts "Cleaning Database"
Review.destroy_all
Category.destroy_all
Package.destroy_all
DateActivity.destroy_all
User.destroy_all

# USERS
puts "Creating Users"

User.new(email: "test@user1.com", password: "123456")
User.new(
  email: "test@user1.com",
  password: "123456"
  offering: true
  first_name: "Tom"
  last_name: "Miller"
  address: "IJsbaanpad 9, 1076 CV Amsterdam"
)

puts "Done!"

# DATE CATEGORY
puts "Creating Date Categories"

CATEGORIES = %w[indoor outdoor casual romatic active passive educational]

CATEGORIES.each do |category|
  Category.new(name: category)
end

Category.new(name: "for free")

puts "Done!"

# DATE ACTIVITIES
puts "Creating Date Activities"



