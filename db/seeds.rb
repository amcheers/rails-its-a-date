require "open-uri"

puts "Cleaning Database"
Review.destroy_all
Category.destroy_all
Package.destroy_all
DateActivity.destroy_all
User.destroy_all

# USERS
puts "Creating Users"

test_one = User.create!(email: "test@user1.com", username: "test1", password: "123456")
test_two = User.create!(
  email: "test@user2.com",
  password: "123456",
  username: "tommy",
  offering: true,
  first_name: "Tom",
  last_name: "Miller",
  address: "IJsbaanpad 9, 1076 CV Amsterdam"
)

puts "Done!"

# DATE CATEGORY
puts "Creating Date Categories"

indoor = Category.create!(name: "indoor")
outdoor = Category.create!(name: "outdoor")
casual = Category.create!(name: "casual")
romantic = Category.create!(name: "romantic")
active = Category.create!(name: "active")
passive = Category.create!(name: "passive")
educational = Category.create!(name: "educational")
for_free = Category.create!(name: "for free")
first_date = Category.create!(name: "good for first date")

puts "Done!"

# DATE ACTIVITIES
puts "Creating Date Activities"

puts "Creating Vondelpark"

vondel_hash = {
  confirmed: true,
  title: "Walk in Vondelpark",
  description: "Vondelpark is a gorgeous place to visit in the middle of the city. It's perfect to get away from the craziness of Amsterdam. Spend your date walking through the park, discovering all of its hidden corners.",
  location: "Van Baerlestraat 5H, 1071 AL Amsterdam",
  price: 0,
  availability: { "Monday": "allday", "Tuesday": "allday", "Wednesday": "allday", "Thursday": "allday", "Friday": "allday", "Saturday": "allday", "Sunday": "allday" },
  user_id: test_two.id
}

vondel_file_one = URI.open('https://unsplash.com/photos/SBiVq9eWEtQ')
vondel_file_two = URI.open('https://unsplash.com/photos/P9gkfbaxMTU')
vondel_file_three = URI.open('https://unsplash.com/photos/NsxzcbdF8fU')

vondel = DateActivity.new(vondel_hash)
[outdoor, casual, active, for_free, first_date].each do |category|
  vondel.categories << category
end

vondel.photos.attach(io: vondel_file_one, filename: 'park_1.png', content_type: 'image/png')
vondel.photos.attach(io: vondel_file_two, filename: 'park_2.png', content_type: 'image/png')
vondel.photos.attach(io: vondel_file_three, filename: 'park_3.png', content_type: 'image/png')
vondel.save!


puts "Creating Oosterpark"

ooster_hash = {
  confirmed: true,
  title: "Walk in Oosterpark",
  description: "Oosterpark is an English garden, which was designed by Dutch landscape architect Leonard Anthony Springer and was laid out in 1891. It's perfect to get away from the craziness of Amsterdam. Spend your date walking through the park, discovering all of its hidden corners.",
  location: "Oosterpark 9, 1091 AC Amsterdam",
  price: 0,
  availability: { "Monday": "allday", "Tuesday": "allday", "Wednesday": "allday", "Thursday": "allday", "Friday": "allday", "Saturday": "allday", "Sunday": "allday" },
  user_id: test_two.id
}

ooster_file_one = URI.open('https://unsplash.com/photos/W0lNN2WvaEA')
ooster_file_two = URI.open('https://unsplash.com/photos/zb13N8EDjGE')
ooster_file_three = URI.open('https://unsplash.com/photos/G3LWwot8ceU')

ooster = DateActivity.new(ooster_hash)
[outdoor, casual, active, for_free, first_date].each do |category|
  ooster.categories << category
end
ooster.photos.attach(io: ooster_file_one, filename: 'ooster_1.png', content_type: 'image/png')
ooster.photos.attach(io: ooster_file_two, filename: 'ooster_2.png', content_type: 'image/png')
ooster.photos.attach(io: ooster_file_three, filename: 'ooster_3.png', content_type: 'image/png')
ooster.save!


puts "Creating Drupa Coffee Roasters"

drupa_hash = {
  confirmed: true,
  title: "Coffee at Drupa Coffee Roasters",
  description: "Drupa Coffee Roasters are specialty coffee roasters, with a focus on Colombian coffee, located in the trendy Jordaan neighborhood in Amsterdam. Enjoy  some freshly brewed coffee or maybe some pastries on the side.",
  location: "Eerste Anjeliersdwarsstraat 6, 1015 NR Amsterdam",
  price: 10,
  availability: { "Monday": "10:00 - 16:00", "Tuesday": "10:00 - 16:00", "Wednesday": "10:00 - 16:00", "Thursday": "10:00 - 16:00", "Friday": "10:00 - 16:00", "Saturday": "10:00 - 16:00", "Sunday": "10:00 - 16:00" },
  user_id: test_two.id
}

drupa_file_one = URI.open('https://unsplash.com/photos/6VhPY27jdps')
drupa_file_two = URI.open('https://unsplash.com/photos/N3btvQ51dL0')
drupa_file_three = URI.open('https://unsplash.com/photos/0z0nT8w_y_o')
drupa_file_four = URI.open('https://unsplash.com/photos/NZMfceSGoQY')

drupa = DateActivity.new(drupa_hash)

[indoor, casual, active].each do |category|
  drupa.categories << category
end

drupa.photos.attach(io: drupa_file_one, filename: 'drupa_1.png', content_type: 'image/png')
drupa.photos.attach(io: drupa_file_two, filename: 'drupa_2.png', content_type: 'image/png')
drupa.photos.attach(io: drupa_file_three, filename: 'drupa_3.png', content_type: 'image/png')
drupa.photos.attach(io: drupa_file_four, filename: 'drupa_4.png', content_type: 'image/png')
drupa.save!

puts "Creating Wonder Experience"

wonder_hash = {
  confirmed: true,
  title: "Visit the Wonder Experience",
  description: "The Wonder Experience is a colorful, indoor playground for adults and children. The Wonder Experience consists of surreal and colorful rooms 12 created vy artists. Take your date out on an unforgetable experience. You can goof around, take funny and cool pictures and express your inner child together.",
  location: "Meeuwenlaan 88, 1021 JK Amsterdam",
  price: 24.50,
  availability: { "Monday": "10:00 - 19:00", "Tuesday": "10:00 - 19:00", "Wednesday": "10:00 - 19:00", "Thursday": "10:00 - 19:00", "Friday": "10:00 - 20:00", "Saturday": "09:00 - 20:00", "Sunday": "09:00 - 19:00" },
  reservation: true,
  reservation_url: "https://tickets.wondrexperience.com/nl/tickets",
  contact_email: "hi@wondrexperience.com",
  user_id: test_two.id
}

wonder_file_one = URI.open('https://res.cloudinary.com/dmwylcvjz/image/upload/v1606833394/IMG_3216_n7nprn.jpg')
wonder_file_two = URI.open('https://res.cloudinary.com/dmwylcvjz/image/upload/v1606833394/IMG_1291_ulpj8n.heic')
wonder_file_three = URI.open('https://res.cloudinary.com/dmwylcvjz/image/upload/v1606833394/IMG_3154_phjvss.heic')

wonder = DateActivity.new(wonder_hash)

[indoor, casual, active].each do |category|
  wonder.categories << category
end

wonder.photos.attach(io: wonder_file_one, filename: 'wonder_1.png', content_type: 'image/png')
wonder.photos.attach(io: wonder_file_two, filename: 'wonder_2.png', content_type: 'image/png')
wonder.photos.attach(io: wonder_file_three, filename: 'wonder_3.png', content_type: 'image/png')
wonder.save!

puts "Done!"

