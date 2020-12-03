require "open-uri"

puts "Cleaning Database"
Review.destroy_all
Category.destroy_all
Package.destroy_all
DateActivity.destroy_all
User.destroy_all


# ------------------------------------------------------
# USERS
puts "Creating Users"

test_one = User.create!(email: "test@user1.com", username: "Admin", password: "123456")
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


# ------------------------------------------------------
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
evening = Category.create!(name: "evening")
dinner = Category.create!(name: "dinner")
drinks = Category.create!(name: "drinks")

puts "Done!"


# ------------------------------------------------------
# DATE ACTIVITIES

puts "Creating Date Activities"


# Vondelpark
puts "Creating Vondelpark"

vondel_hash = {
  confirmed: true,
  title: "Walk in Vondelpark",
  description: "Vondelpark is a gorgeous place to visit in the middle of the city. It's perfect to get away from the craziness of Amsterdam. Spend your date walking through the park, discovering all of its hidden corners.",
  location: "Van Baerlestraat 5H, 1071AL Amsterdam",
  price: 0,
  availability: { "Monday": "allday", "Tuesday": "allday", "Wednesday": "allday", "Thursday": "allday", "Friday": "allday", "Saturday": "allday", "Sunday": "allday" },
  user_id: test_four.id
}

vondel_file_one = URI.open('https://images.unsplash.com/photo-1519331379826-f10be5486c6f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80')
vondel_file_two = URI.open('https://images.unsplash.com/photo-1568480289356-5a75d0fd47fc?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80')
vondel_file_three = URI.open('https://images.unsplash.com/photo-1588714477688-cf28a50e94f7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80')

vondel = DateActivity.new(vondel_hash)
[outdoor, casual, active, for_free, first_date, morning, afternoon].each do |category|
  vondel.categories << category
end

vondel.photos.attach(io: vondel_file_one, filename: 'park_1.png', content_type: 'image/png')
vondel.photos.attach(io: vondel_file_two, filename: 'park_2.png', content_type: 'image/png')
vondel.photos.attach(io: vondel_file_three, filename: 'park_3.png', content_type: 'image/png')
vondel.save!


# Oosterpark
puts "Creating Oosterpark"

ooster_hash = {
  confirmed: true,
  title: "Walk in Oosterpark",
  description: "Oosterpark is an English garden, which was designed by Dutch landscape architect Leonard Anthony Springer and was laid out in 1891. It's perfect to get away from the craziness of Amsterdam. Spend your date walking through the park, discovering all of its hidden corners.",
  location: "Oosterpark 9, 1091AC Amsterdam",
  price: 0,
  availability: { "Monday": "allday", "Tuesday": "allday", "Wednesday": "allday", "Thursday": "allday", "Friday": "allday", "Saturday": "allday", "Sunday": "allday" },
  user_id: test_four.id
}

ooster_file_one = URI.open('https://images.unsplash.com/photo-1569828740284-df1486353d20?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80')
ooster_file_two = URI.open('https://images.unsplash.com/photo-1504810935423-dbbe9a698963?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=282&q=80')
ooster_file_three = URI.open('https://images.unsplash.com/photo-1445937888010-cc262f556033?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80')

ooster = DateActivity.new(ooster_hash)
[outdoor, casual, active, for_free, first_date, morning, afternoon].each do |category|
  ooster.categories << category
end
ooster.photos.attach(io: ooster_file_one, filename: 'ooster_1.png', content_type: 'image/png')
ooster.photos.attach(io: ooster_file_two, filename: 'ooster_2.png', content_type: 'image/png')
ooster.photos.attach(io: ooster_file_three, filename: 'ooster_3.png', content_type: 'image/png')
ooster.save!

# Drupa Coffee Shop
puts "Creating Drupa Coffee Roasters"

drupa_hash = {
  confirmed: true,
  title: "Coffee at Drupa Coffee Roasters",
  description: "Drupa Coffee Roasters are specialty coffee roasters, with a focus on Colombian coffee, located in the trendy Jordaan neighborhood in Amsterdam. Enjoy  some freshly brewed coffee or maybe some pastries on the side.",
  location: "Eerste Anjeliersdwarsstraat 6, 1015NR Amsterdam",
  price: 10,
  availability: { "Monday": "10:00 - 16:00", "Tuesday": "10:00 - 16:00", "Wednesday": "10:00 - 16:00", "Thursday": "10:00 - 16:00", "Friday": "10:00 - 16:00", "Saturday": "10:00 - 16:00", "Sunday": "10:00 - 16:00" },
  user_id: test_four.id
}

drupa_file_one = URI.open('https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80')
drupa_file_two = URI.open('https://images.unsplash.com/photo-1522012188892-24beb302783d?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=334&q=80')
drupa_file_three = URI.open('https://images.unsplash.com/photo-1565636291143-9cc6c6f87445?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80')
drupa_file_four = URI.open('https://images.unsplash.com/photo-1466337105551-aa3ab7890939?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80')

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

# wonder experience
wonder_hash = {
  confirmed: true,
  title: "Visit to the Wonder Experience",
  description: "The Wonder Experience is a colorful, indoor playground for adults and children. The Wonder Experience consists of surreal and colorful rooms 12 created vy artists. Take your date out on an unforgetable experience. You can goof around, take funny and cool pictures and express your inner child together.",
  location: "Meeuwenlaan 88, 1021JK Amsterdam",
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

# Electric Ladyland
puts "Creating Electric Lady"

electric_hash = {
  confirmed: true,
  title: "Visit to the Electric Ladyland - Museum of Fluorescent Art",
  description: "The only Museum of it'd kind in the world, 'Electric Ladyland - the First Museum of Fluorescent Art' houses a large room-sized Fluorescent Environment that the visitor enters, becomes a part of the piece of Art, and then experiences 'Participatory Art'. The guided tour of the museum also includes demonstrations of large collections of Fluorescent Minerals from all over the world. These very common rocks burst into dazzling colors when seen under different wavelengths of 'light.",
  location: "Tweede Leliedwarsstraat 5, 1015TB Amsterdam",
  price: 5,
  availability: { "Monday": "closed", "Tuesday": "closed", "Wednesday": "14:00 - 18:00", "Thursday": "14:00 - 18:00", "Friday": "14:00 - 18:00", "Saturday": "14:00 - 18:00", "Sunday": "closed" },
  reservation: true,
  reservation_url: "http://www.electricladyland.appointy.com",
  contact_email: "electriclady21@hotmail.com",
  user_id: test_four.id
}

electric_file_one = URI.open('http://www.electric-lady-land.com/el-2-jpeg-full%20env')
electric_file_two = URI.open('http://www.electric-lady-land.com/058.Fluo.Min.Box-SW.jpg')
electric_file_three = URI.open('http://www.electric-lady-land.com/gallery*.jpg')

electric = DateActivity.new(electric_hash)

[indoor, casual, educational, afternoon].each do |category|
  electric.categories << category
end

electric.photos.attach(io: electric_file_one, filename: 'electric_1.png', content_type: 'image/png')
electric.photos.attach(io: electric_file_two, filename: 'electric_2.png', content_type: 'image/png')
electric.photos.attach(io: electric_file_three, filename: 'electric_3.png', content_type: 'image/png')
electric.save!

# Windmill
puts "Creating Tap Room the Windmill"

windmill_hash = {
  confirmed: true,
  title: "Grab a Beer at the Tap Room the Windmill",
  description: "The windmill Tap Room is located in the same former bathhouse that also houses our first brewery location of the Brouwerij'tij, right under Amsterdam’s biggest windmill. The majority of beers that we brew are available on tap in this tap room. It’s self-service only so order your drink at the bar and find yourself a suitable spot. In summer there’s also long tables outside on our terrace, and in winter you’ll find shelter between the old bathhouse walls. Food wise they offer a basic menu of tasty beer snacks. Enjoy a cold beer with your date and have a great time at this authentic location.",
  location: "Funenkade 7, 1018AL Amsterdam",
  price: 20,
  availability: { "Monday": "12:00 - 20:00", "Tuesday": "12:00 - 20:00", "Wednesday": "12:00 - 20:00", "Thursday": "12:00 - 20:00", "Friday": "12:00 - 20:00", "Saturday": "12:00 - 20:00", "Sunday": "12:00 - 20:00" },
  user_id: test_four.id
}

windmill_file_one = URI.open('https://www.brouwerijhetij.nl/wp-content/uploads/2019/10/brouwerijhetij_PD2019_012-1440x960.jpg')
windmill_file_two = URI.open('https://www.brouwerijhetij.nl/wp-content/uploads/2019/12/BrouwerijtIJ_molen_2019_003-1.jpg')
windmill_file_three = URI.open('http://www.brouwerijhetij.nl/wp-content/uploads/2015/06/brouwerijtij_ijwit_001.jpg')
windmill_file_four = URI.open('https://www.brouwerijhetij.nl/wp-content/uploads/2020/07/brouwerijhetij_Biri_2020.jpg')

windmill = DateActivity.new(windmill_hash)

[indoor, outdoor, casual, lunch, afternoon, drinks].each do |category|
  windmill.categories << category
end

windmill.photos.attach(io: windmill_file_one, filename: 'windmill_1.png', content_type: 'image/png')
windmill.photos.attach(io: windmill_file_two, filename: 'windmill_2.png', content_type: 'image/png')
windmill.photos.attach(io: windmill_file_three, filename: 'windmill_3.png', content_type: 'image/png')
windmill.photos.attach(io: windmill_file_four, filename: 'windmill_4.png', content_type: 'image/png')
windmill.save!


# Salsa Class
puts "Creating Salsa Class"

salsa_hash = {
  confirmed: true,
  title: "Have fun at Weekly Salsa Class at Punto Cubano",
  description: "Do you fancy a Cuban salsa course together with your other half? - Everyone is welcome for the salsa courses of El Punto Cubano, to discover the real Cuban Salsa. Each lesson starts with a relaxed and rhythmic warming up in which you get to know different (Afro) Cuban rhythms like Son, Rumba, Pilon, Chachacha, etc. Then you learn in pairs to apply the basic figures and rhythms in the dance. Thereby the pleasure in dancing is the most important. All our lessons are always offered by a Cuban teacher. A course consist of 10 lessons of 60 minutes and costs 100€.",
  location: "Borgerstraat 112, 1053PX Amsterdam",
  price: 100,
  availability: {
      "Monday": {"beginners": "19:00 - 20:00", "average": "20:00 - 21:00", "semi/advance": "21:00 - 22:00"},
      "Thursday": { "beginners": "19:00 - 20:00", "average": "20:00 - 21:00", "semi/advance": "21:00 - 22:00" }
    },
  reservation: true,
  reservation_url: "http://www.puntocubano.nl/",
  contact_email: "info@puntocubano.nl",
  user_id: test_four.id
}

salsa_file_one = URI.open('https://images.unsplash.com/photo-1587922342650-955e9760d689?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8Y291cGxlJTIwZGFuY2luZ3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
salsa_file_two = URI.open('https://images.unsplash.com/photo-1504609813442-a8924e83f76e?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80')
salsa_file_three = URI.open('https://images.unsplash.com/photo-1511804269794-309fade1da5d?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=629&q=80')

salsa = DateActivity.new(salsa_hash)

[indoor, active, evening].each do |category|
  salsa.categories << category
end

salsa.photos.attach(io: salsa_file_one, filename: 'salsa_1.png', content_type: 'image/png')
salsa.photos.attach(io: salsa_file_two, filename: 'salsa_2.png', content_type: 'image/png')
salsa.photos.attach(io: salsa_file_three, filename: 'salsa_3.png', content_type: 'image/png')
salsa.save!


# Indoor Skydiving
puts "Creating Indoor Skydiving"

skydiving_hash = {
  confirmed: true,
  title: "Learn how to Fly and Try Indoor Skydiving",
  description: "The ultimate indoor skydiving center in the Netherlands. Experience an unforgettable free fall in the World's first center with two tunnels! Every package includes flight gear, briefing and certificate. All packages last about 2 hours. From the age of 6 everyone* is welcome to fly and prior flying experience is not required. All your flights will be recorded by our HD video and photo system. These will be offered directly after your flights by email for 10€ per person and will be uploaded to youtube and dropbox. Of course, you can share them right away. Due to safety reasons, you can not bring your own camera or telephone in the tunnel or antechamber.",
  location: "De Heldinnenlaan 1, 3543AA Utrecht",
  price: 65,
  availability: { "Monday": "09:00 - 21:00", "Tuesday": "09:00 - 21:00", "Wednesday": "09:00 - 21:00", "Thursday": "09:00 - 21:00", "Friday": "09:00 - 21:00", "Saturday": "09:00 - 21:00", "Sunday": "09:00 - 21:00" },
  reservation: true,
  reservation_url: "https://cityskydive.nl/en/book-your-first-flights/4",
  contact_email: "service@cityskydive.nl",
  user_id: test_four.id
}

skydiving_file_one = URI.open('https://cityskydive.nl/uploads/headers/0da75f00f2801115e66ec6f58a5c871a1942058c.jpg')
skydiving_file_two = URI.open('https://cityskydive.nl/uploads/headers/51f5d7b5e0346c57ea86618be7c77fb047b2b7c7.jpg')
skydiving_file_three = URI.open('https://indoorskydive.com/wp-content/uploads/2020/11/ISR-formatie-skydiven-4-1-scaled.jpg')

skydiving = DateActivity.new(skydiving_hash)

[indoor, active, evening].each do |category|
  skydiving.categories << category
end

skydiving.photos.attach(io: skydiving_file_one, filename: 'skydiving_1.png', content_type: 'image/png')
skydiving.photos.attach(io: skydiving_file_two, filename: 'skydiving_2.png', content_type: 'image/png')
skydiving.photos.attach(io: skydiving_file_three, filename: 'skydiving_3.png', content_type: 'image/png')
skydiving.save!


# Old-school Cocktails
puts "Creating Cocktail 1"

cocktail_one_hash = {
  confirmed: true,
  title: "Enjoy a fancy drink at Door 74",
  description: "Find us behind our hidden door in the city centre of Amsterdam and enjoy a night full of delicious and perfectly balanced cocktails, antique barware, good company and vintage surroundings. Discover classic and creative cocktails inbetween dark wood and art deco accents which adorn the Prohibition era-style.",
  location: "Reguliersdwarsstraat 74, 1017BN Amsterdam",
  price: 40,
  availability: { "Monday": "closed", "Tuesday": "closed", "Wednesday": "closed", "Thursday": "17:30 - 00:00", "Friday": "17:30 - 03:00", "Saturday": "17:30 - 03:00", "Sunday": "17:30 - 00:00" },
  user_id: test_four.id
}

cocktail_one_file_one = URI.open('https://images.unsplash.com/photo-1470337458703-46ad1756a187?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=749&q=80')
cocktail_one_file_two = URI.open('https://unsplash.com/photos/dmOFwtOIhJA')
cocktail_one_file_three = URI.open('https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80')

cocktail_one = DateActivity.new(cocktail_one_hash)

[indoor, casual, evening, drinks].each do |category|
  cocktail_one.categories << category
end

cocktail_one.photos.attach(io: cocktail_one_file_one, filename: 'cocktail_one_1.png', content_type: 'image/png')
cocktail_one.photos.attach(io: cocktail_one_file_two, filename: 'cocktail_one_2.png', content_type: 'image/png')
cocktail_one.photos.attach(io: cocktail_one_file_three, filename: 'cocktail_one_3.png', content_type: 'image/png')
cocktail_one.save!


# Cocktails
puts "Creating Cocktail 2"

cocktail_two_hash = {
  confirmed: true,
  title: "Have a drink at Bar Mokum",
  description: "Come and enjoy classy cocktails, but without the pompousness. As much as possible, we use Dutch spirits & liquors and try to benefit from local products and produce. And we’ll accompany it all with some old school hip-hop, funk, soul, jazz, and the occasional typical Dutch ballad.",
  location: "Ferdinand Bolstraat 11, 1072LA Amsterdam",
  price: 40,
  availability: { "Monday": "18:00 - 00:30", "Tuesday": "18:00 - 00:30", "Wednesday": "18:00 - 00:30", "Thursday": "18:00 - 00:30", "Friday": "18:00 - 02:00", "Saturday": "18:00 - 02:00", "Sunday": "18:00 - 00:30" },
  user_id: test_four.id
}

cocktail_two_file_one = URI.open('https://www.barmokum.nl/wp-content/uploads/8-klein-683x1024.jpg')
cocktail_two_file_two = URI.open('https://www.barmokum.nl/wp-content/uploads/15-klein-683x1024.jpg')
cocktail_two_file_three = URI.open('https://www.barmokum.nl/wp-content/uploads/19-klein-1024x683.jpg')
cocktail_two_file_four = URI.open('https://images.unsplash.com/photo-1468465236047-6aac20937e92?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=331&q=80')

cocktail_two = DateActivity.new(cocktail_two_hash)

[indoor, casual, evening, drinks].each do |category|
  cocktail_two.categories << category
end

cocktail_two.photos.attach(io: cocktail_two_file_one, filename: 'cocktail_two_1.png', content_type: 'image/png')
cocktail_two.photos.attach(io: cocktail_two_file_two, filename: 'cocktail_two_2.png', content_type: 'image/png')
cocktail_two.photos.attach(io: cocktail_two_file_three, filename: 'cocktail_two_3.png', content_type: 'image/png')
cocktail_two.photos.attach(io: cocktail_two_file_four, filename: 'cocktail_two_4.png', content_type: 'image/png')
cocktail_two.save!

puts "Done!"

# -----------------------------------------------------
# REVIEWS

puts "Creating Reviews"


# Vondelpark
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


# Oosterpark
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


# Drupa Coffee Rostery
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


# Wonder Experience
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


# Electric Lady
puts "Creating Electric Lady Reviews"

electric_one = Review.new(
  content: "It's tiny, and with an insanely low ceiling...  but charming, and creative, and constantly evolving.  Your host is warm and open and willing to explain anything.",
  rating: 3,
  user_id: test_one.id
  )
electric_one.activity = electric
electric_one.save!

electric_two = Review.new(
  content: "I LOVE THIS PLACE. For light nerds, geology nerds, history nerds, and those who are just generally fascinated by the natural. Run by a D A R L I N G couple with absolute love for their work, and sharing it with anyone who is interested. My partner and I went on my birthday and they gave me a hand made birthday card. It was amazing!",
  rating: 5,
  user_id: test_two.id
  )
electric_two.activity = electric
electric_two.save!

electric_three = Review.new(
  content: "More of a small showroom than a traditional museum. The owner is a nice gentleman who was fascinated by fluorescent artwork in his young teens, and he studied mineralogy and travelled the globe to find the treasures which he showcases in his little museum. There is one large fluorescent environment, which has many different parts which he created from inspirations of his travels. He shows you cool little tricks and nuances of fluorescent art and rocks, and his passion is very evident! Overall a cool experience! Worth seeing once in life, especially from a guide who can share his fascination!",
  rating: 5,
  user_id: test_three.id
  )
electric_three.activity = electric
electric_three.save!


# Windmill
puts "Creating Windmill Reviews"

windmill_one = Review.new(
  content: "Nice to have a quality beer on a sunny day. Indoors has a subway tile vibe with bench seats and after a few it can be comfy on a rainy day but will mostly be accompanied by tourists. The limited brews on tap is worth a look if you are in the area.",
  rating: 3,
  user_id: test_one.id
  )
windmill_one.activity = windmill
windmill_one.save!

windmill_two = Review.new(
  content: "A beautiful brewery in a quaint location with a view of the canals. This place offers plenty of variety with their beers at a competitive price - but forget the prices because personally I'd be happy to pay more as their brews are delicious.",
  rating: 4,
  user_id: test_two.id
  )
windmill_two.activity = windmill
windmill_two.save!

windmill_three = Review.new(
  content: "The brewery is located inside an old mill, how cool is that? We went there to sample their craft beers and some starters. Beers were very good, we had a 5 beer sample selection and a plate of sausage and cheese to go with it. Price is ok for what you get and the beers were fantastic. The interior is nice and there are bottles of beer all over the walls like in a museum.",
  rating: 5,
  user_id: test_three.id
  )
windmill_three.activity = windmill
windmill_three.save!


# Salsa Classes
puts "Creating Salsa Classes Reviews"

salsa_one = Review.new(
  content: "Good and fun dance school for when you want to learn or improve Cuban salsa!",
  rating: 4,
  user_id: test_one.id
  )
salsa_one.activity = salsa
salsa_one.save!

salsa_two = Review.new(
  content: "This schools’ teacher is a real Master in his heart and in his art. Not only will he teach you the basics, the cool moves and the music. He will teach you the history the roots and the background of salsa and Cuban music in general. Which make lessons a lot more interesting, inspiring  and challenging. I’ve been incredibly lucky by having received lessons from Angel Ford at Punto Cubano. I highly  recomend this school to anyone who’s really into music , dance, hard  work and a lot of fun.",
  rating: 5,
  user_id: test_two.id
  )
salsa_two.activity = salsa
salsa_two.save!


# Indoor Skydiving
puts "Creating Indoor Skydiving Reviews"

skydiving_one = Review.new(
  content: "Fun Activity at a beautiful location, the indoor skydiving tubes are located at a higher floor with a nice open bar from which you can view the tubes and also enjoy a view over the area. The skydiving is fun, not scary and in a good flow. The personal is very friendly and really enthusiastic.",
  rating: 5,
  user_id: test_one.id
  )
skydiving_one.activity = skydiving
skydiving_one.save!

skydiving_two = Review.new(
  content: "Indoor skydiving it is great fun and the staff is really great. We had a great time as a family. You can also sit and have a coffee to see if it is something for you. It is a bit expensive that's why 4 stars.",
  rating: 4,
  user_id: test_two.id
  )
skydiving_two.activity = skydiving
skydiving_two.save!

# Cocktail 1
puts "Creating Cocktail 1 Reviews"

cocktail_one_one = Review.new(
  content: "Such a cool cocktail place. The staff is extremely friendly and the bartender is very skilled - the cocktails were delicious.",
  rating: 4,
  user_id: test_one.id
  )
cocktail_one_one.activity = cocktail_one
cocktail_one_one.save!

cocktail_one_two = Review.new(
  content: "This place is something else. You have to know about it to find it. From the outside it doesn’t look more that a random door. When you ring the bell someone will guide you inside to such an amazing speakeasy. The staff is super passionate about making you a drink that will blow you away. Definitely coming back!",
  rating: 5,
  user_id: test_two.id
  )
cocktail_one_two.activity = cocktail_one
cocktail_one_two.save!

cocktail_one_three = Review.new(
  content: "Very cozy bar with a speak easy concept that came from the US. Bartenders are very friendly and know their way around cocktails. Great signature cocktails, but they're also happy to take up the challenge for a more custom sort. A tiny bit expensive would be the only downside of this place.",
  rating: 4,
  user_id: test_three.id
  )
cocktail_one_three.activity = cocktail_one
cocktail_one_three.save!
# -----------------------------------------------------
# Packages

puts "Creating Packages"

#Wildlife
puts "Wildlife"
Package.create(title: "Wildlife", user: User.first)
Package.find(1).date_activities << DateActivity.find(1)
Package.find(1).date_activities << DateActivity.find(2)
Package.find(1).date_activities << DateActivity.find(6)

#WinterWonder
puts "WinterWonder"
Package.create(title: "WinterWonder", user: User.first)
Package.find(2).date_activities << DateActivity.find(3)
Package.find(2).date_activities << DateActivity.find(4)

#Action
puts "Action"
Package.create(title: "Action", user: User.first)
Package.find(3).date_activities << DateActivity.find(7)
Package.find(3).date_activities << DateActivity.find(8)

#Drinking
puts "Drinking"
Package.create(title: "Drinking", user: User.first)
Package.find(4).date_activities << DateActivity.find(9)
Package.find(4).date_activities << DateActivity.find(10)

#Suprise
puts "Creating Suprise"
Package.create(title: "Suprise", user: User.first)
Package.find(5).date_activities << DateActivity.find(4)
Package.find(5).date_activities << DateActivity.find(6)
Package.find(5).date_activities << DateActivity.find(7)

puts "Done!"
