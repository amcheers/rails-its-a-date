require "open-uri"

puts "Cleaning Database"
Review.destroy_all
Category.destroy_all
Package.destroy_all
DateActivity.destroy_all
User.destroy_all

# USERS
puts "Creating Users"

test_one = User.create!(email: "test@user1.com", username: "Fred1", password: "123456")
test_two = User.create!(email: "test@user2.com", username: "Laura2", password: "123456")
test_three = User.create!(email: "test@user3.com", username: "Hanna3", password: "123456")
test_four = User.create!(
  email: "test@user4.com",
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
morning = Category.create!(name: "morning")
lunch = Category.create!(name: "lunch")
afternoon = Category.create!(name: "afternoon")
dinner = Category.create!(name: "dinner")
evening = Category.create!(name: "evening")

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
  user_id: test_four.id
}

vondel_file_one = URI.open('https://unsplash.com/photos/SBiVq9eWEtQ')
vondel_file_two = URI.open('https://unsplash.com/photos/P9gkfbaxMTU')
vondel_file_three = URI.open('https://unsplash.com/photos/NsxzcbdF8fU')

vondel = DateActivity.new(vondel_hash)
[outdoor, casual, active, for_free, first_date, morning, afternoon].each do |category|
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
  user_id: test_four.id
}

ooster_file_one = URI.open('https://unsplash.com/photos/W0lNN2WvaEA')
ooster_file_two = URI.open('https://unsplash.com/photos/zb13N8EDjGE')
ooster_file_three = URI.open('https://unsplash.com/photos/G3LWwot8ceU')

ooster = DateActivity.new(ooster_hash)
[outdoor, casual, active, for_free, first_date, morning, afternoon].each do |category|
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
  user_id: test_four.id
}

drupa_file_one = URI.open('https://unsplash.com/photos/6VhPY27jdps')
drupa_file_two = URI.open('https://unsplash.com/photos/N3btvQ51dL0')
drupa_file_three = URI.open('https://unsplash.com/photos/0z0nT8w_y_o')
drupa_file_four = URI.open('https://unsplash.com/photos/NZMfceSGoQY')

drupa = DateActivity.new(drupa_hash)

[indoor, casual, first_date, afternoon, lunch].each do |category|
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
  user_id: test_four.id
}

wonder_file_one = URI.open('https://res.cloudinary.com/dmwylcvjz/image/upload/v1606833394/IMG_3216_n7nprn.jpg')
wonder_file_two = URI.open('https://res.cloudinary.com/dmwylcvjz/image/upload/v1606833394/IMG_1291_ulpj8n.heic')
wonder_file_three = URI.open('https://res.cloudinary.com/dmwylcvjz/image/upload/v1606833394/IMG_3154_phjvss.heic')

wonder = DateActivity.new(wonder_hash)

[indoor, casual, active, morning, afternoon].each do |category|
  wonder.categories << category
end

wonder.photos.attach(io: wonder_file_one, filename: 'wonder_1.png', content_type: 'image/png')
wonder.photos.attach(io: wonder_file_two, filename: 'wonder_2.png', content_type: 'image/png')
wonder.photos.attach(io: wonder_file_three, filename: 'wonder_3.png', content_type: 'image/png')
wonder.save!

puts "Done!"

puts "Creating Reviews"

puts "Creating Vondel Reviews"

review_vondel_one = Review.new(
  content: "One of the best spots in Amsterdam! Love the atmosphere in the Vondelpark especially during a sunny day, it is cozy, relaxing and fun all together. Wouldn't recommend it for a date on a rainy day though.",
  rating: 4,
  user_id: test_one.id
  )
review_vondel_one.activity = vondel
review_vondel_one.save!

review_vondel_two = Review.new(
  content: "Gorgeous place to visit in the middle of the city. It was slowing when I was there, making it even more magical to be on a date here.",
  rating: 5,
  user_id: test_two.id
  )
review_vondel_two.activity = vondel
review_vondel_two.save!

review_vondel_three = Review.new(
  content: "A lovely park to ride through, take a stroll in or chill, lovely atmosphere, no trouble and peaceful. I had my first date with my current partner here and it was magical.",
  rating: 3,
  user_id: test_three.id
  )
review_vondel_three.activity = vondel
review_vondel_three.save!



puts "Creating Oosterpark Reviews"

review_ooster_one = Review.new(
  content: "Well laid out, with plenty of grass for games, trees and water to provide a pleasant environment; some interesting sculptures. But it can get a bit crowded; and watch out for cyclists; they can really ruin a date.",
  rating: 3,
  user_id: test_one.id
  )
review_ooster_one.activity = ooster
review_ooster_one.save!

review_ooster_two = Review.new(
  content: "Facilities are good beautiful lake in the middle. Lovely park with lots of activities going on.",
  rating: 4,
  user_id: test_two.id
  )
review_ooster_two.activity = ooster
review_ooster_two.save!

review_ooster_three = Review.new(
  content: "Lovely park! Lots of places to do a picnic or group gatherings, birthday celebrations and just about anything else. Great to get to know one another without feeling like you are in a formal environment.",
  rating: 5,
  user_id: test_three.id
  )
review_ooster_three.activity = ooster
review_ooster_three.save!

puts "Creating Drupa Reviews"

review_drupa_one = Review.new(
  content: "The coffee is roasted in the same room, so it is smelly. My date didn't mind, but I kept on getting distracted by the smell.",
  rating: 4,
  user_id: test_one.id
  )
review_drupa_one.activity = drupa
review_drupa_one.save!

review_drupa_two = Review.new(
  content: "Such craft and care put into each cup they serve. My chai latte was delicious, and all the coffee drinks I saw them prepare made me want to start drinking coffee. My date loved the place, so we had an amazing time.",
  rating: 5,
  user_id: test_two.id
  )
review_drupa_two.activity = drupa
review_drupa_two.save!

review_drupa_three = Review.new(
  content: "Very cozy place with so kind people. Great atmosphere and exactly delicious coffee. No matter what do you prefer espresso or flat white it will be very tasty. Definitely a great location for a date since it's not too loud and crowded.",
  rating: 5,
  user_id: test_three.id
  )
review_drupa_three.activity = drupa
review_drupa_three.save!

puts "Creating Wonder Reviews"

review_wonder_one = Review.new(
  content: "My boyfriend and I decided to go to WONDR Experience to celebrate our second anniversary and we had such a blast! We aren't the kind of people who usually feel comfortable taking pictures and posing so we were a bit nervous at first. That being said, the staff made us feel so comfortable by passing us props and giving us some pose ideas.",
  rating: 5,
  user_id: test_one.id
  )
review_wonder_one.activity = wonder
review_wonder_one.save!

review_wonder_two = Review.new(
  content: "It was my first time and I got to say the staff is just one of a kind! We were received by Irem who patiently and sooo kindly explained everything to us. We took great pictures!",
  rating: 5,
  user_id: test_two.id
  )
review_wonder_two.activity = wonder
review_wonder_two.save!

review_wonder_three = Review.new(
  content: "Very cozy place with so kind people. Great atmosphere and exactly delicious coffee. No matter what do you prefer espresso or flat white it will be very tasty. Definitely a great location for a date since it's not too loud and crowded.",
  rating: 5,
  user_id: test_three.id
  )
review_wonder_three.activity = wonder
review_wonder_three.save!

puts "Done!"
