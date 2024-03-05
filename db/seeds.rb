if:Rails.env.production
  Nationality.destroy_all
  User.destroy_all
  Restaurant.destroy_all
  Review.destroy_all
  Bookmark.destroy_all

end

nationality1= Nationality.create!(
  Nationality: "turkish"
)

Nationality.create!(
  Nationality: "italian"
)

# Seed 3
Nationality.create!(
  Nationality: "Indian"
)

# Seed 4
Nationality.create!(
  Nationality: "thai"
)

# Seed 5
Nationality.create!(
  Nationality: "Syrian"
)

# Seed 6
Nationality.create!(
  Nationality: "Turkish"
)
user1= User.create!(
  email: "jhon@smith.com",
  password: "1234567",
  username: "Fouad Merkel",
  photo: "https://image.hurimg.com/i/hurriyet/75/0x0/59c9c56b45d2a027e83e2b0b.jpg",
  description: "originally from Morocco, loving food and travel , I am living in Berlin in the last 20 years and I am a foodie, check my reviews there are authentic "

)
# Seed 2
user2= User.create!(
  email: "alice@example.com",
  password: "password123",
  username: "Alice Johnson",
  photo: "https://example.com/alice.jpg",
  description: "Hello, I'm Alice! I enjoy exploring new places and trying different cuisines. Currently based in London."
)

# Seed 3
user3= User.create!(
  email: "bob@example.com",
  password: "bobpassword",
  username: "Bob Smith",
  photo: "https://example.com/bob.jpg",
  description: "Hey there! I'm Bob, a nature enthusiast and aspiring photographer. Living in Vancouver, Canada."
)

# Seed 4
user4= User.create!(
  email: "emma@example.com",
  password: "emma1234",
  username: "Emma Davis",
  photo: "https://example.com/emma.jpg",
  description: "Hi, I'm Emma. I have a passion for art and design. Currently calling Paris my home."
)

# Seed 5
user5= User.create!(
  email: "david@example.com",
  password: "davidpass",
  username: "David Miller",
  photo: "https://example.com/david.jpg",
  description: "Greetings! I'm David, a tech enthusiast and avid reader. Residing in San Francisco, USA."
)

# Seed 6
user6= User.create!(
  email: "lily@example.com",
  password: "lilypassword",
  username: "Lily Brown",
  photo: "https://example.com/lily.jpg",
  description: "Hello from Lily! I love music and outdoor activities. Currently enjoying life in Sydney, Australia."
)

nationality_list1= Nationalities_list.create!(
user_id: user1.id,

)

# NationalitiesList 1
nationality_list2= NationalitiesList.create!(
  user_id: user2.id
)

# NationalitiesList 2
nationality_list3= NationalitiesList.create!(
  user_id: user3.id
)

# NationalitiesList 3
nationality_list4= NationalitiesList.create!(
  user_id: user4.id
)

# NationalitiesList 4
nationality_list5= NationalitiesList.create!(
  user_id: user5.id
)

# NationalitiesList 5
nationality_list6= NationalitiesList.create!(
  user_id: user6.id
)

restaurant1= Restaurant.create!(
  name: "City Chicken",
  address:"Sonnenallee 59, 12045 Berlin",
  cuisine: "turkish",
  phone: "030-6248600",
  photo: "https://lh3.googleusercontent.com/p/AF1QipO5ocbjjwmv1W9aKz4Fj2aETBHNQ6UeQeG5LCGh=s1360-w1360-h1020-rw",
  description: "Best chicken",
  take_away: true,
  price_catagory: "1",
  authentic_badge: false,
  opening_hours: "09:00-00:00",
  neighborhood: "Neuköln",
  dietary_requirements: "Halal"
)

# Seed 2
restaurant2= Restaurant.create!(
  name: "Flavors of Bangkok",
  address: "Kurfürstendamm 123, 10711 Berlin",
  cuisine: "Asian",
  phone: "030-9876543",
  photo: "https://example.com/flavors_of_arabia.jpg",
  description: "Authentic Middle Eastern flavors that transport you to the heart of Arabia.",
  take_away: true,
  price_catagory: "2",
  authentic_badge: true,
  opening_hours: "11:00-23:00",
  neighborhood: "Charlottenburg",
  dietary_requirements: "Vegetarian-friendly"
)

# Seed 3
restaurant3 =Restaurant.create!(
  name: "Roma Pizza",
  address: "Friedrichstraße 45, 10117 Berlin",
  cuisine: "Italian",
  phone: "030-3333333",
  photo: "https://example.com/mediterranean_oasis.jpg",
  description: "Escape to a Mediterranean paradise with our delightful dishes and serene ambiance.",
  take_away: true,
  price_catagory: "3",
  authentic_badge: false,
  opening_hours: "12:00-22:00",
  neighborhood: "Mitte",
  dietary_requirements: "Gluten-free options"
)

# Seed 4
restaurant4= Restaurant.create!(
  name: "Spicy Haven",
  address: "Hauptstraße 76, 10317 Berlin",
  cuisine: "Indian",
  phone: "030-11112222",
  photo: "https://example.com/spicy_haven.jpg",
  description: "Embark on a spice-filled journey with our authentic Indian flavors and aromatic dishes.",
  take_away: true,
  price_catagory: "2",
  authentic_badge: true,
  opening_hours: "10:00-21:00",
  neighborhood: "Treptow",
  dietary_requirements: "Vegan options"
)

# Seed 5
restaurant5= Restaurant.create!(
  name: "Thai Mai",
  address: "Warschauer Straße 15, 10245 Berlin",
  cuisine: "thai",
  phone: "030-55554444",
  photo: "https://example.com/urban_eats.jpg",
  description: "A culinary adventure through global flavors, bringing the world to your plate.",
  take_away: true,
  price_catagory: "3",
  authentic_badge: false,
  opening_hours: "08:00-20:00",
  neighborhood: "Friedrichshain",
  dietary_requirements: "Allergen-free options"
)

# Seed 6
restaurant6= Restaurant.create!(
  name: "Taco Delight",
  address: "Alexanderplatz 2, 10178 Berlin",
  cuisine: "mexican",
  phone: "030-99998888",
  photo: "https://example.com/sushi_delight.jpg",
  description: "Experience the art of sushi-making with our fresh and exquisite Japanese creations.",
  take_away: true,
  price_catagory: "4",
  authentic_badge: true,
  opening_hours: "14:00-23:00",
  neighborhood: "Mitte",
  dietary_requirements: "Pescatarian options"
)

review1 = Review.create!(
  user_id: user1.id,
  restaurant_id: restaurant1.id,
  rating: "5",
  service: "5",
  description: "the greatest place in town! such a crazy chicken!",
  photo: "https://imageproxy.wolt.com/venue/6049015c277cf0ebd69a61f7/cbc3ba12-077b-11ed-bc5c-722a4a08bf78_city_chicken_close_up_2.jpg",
)

bookmark1= Bookmark.create!(
  user_id= user1.id,
  restaurant_id= restaurant1.id,
)


# Bookmark 1
Bookmark.create!(
  user_id: 1,
  restaurant_id: restaurant1.id
)

# Bookmark 2
Bookmark.create!(
  user_id: 2,
  restaurant_id: restaurant2.id
)

# Bookmark 3
Bookmark.create!(
  user_id: 3,
  restaurant_id: restaurant3.id
)

# Bookmark 4
Bookmark.create!(
  user_id: 4,
  restaurant_id: restaurant4.id
)

# Bookmark 5
Bookmark.create!(
  user_id: 5,
  restaurant_id: restaurant5.id
)

# Bookmark 6
Bookmark.create!(
  user_id: 6,
  restaurant_id: restaurant6.id
)
