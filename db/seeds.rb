if:Rails.env.production
  Nationality.destroy_all
  User.destroy_all
  Restaurant.destroy_all
  Review.destroy_all
  Bookmark.destroy_all

end

nationality1= Nationality.create!(
  Nationality: "Moroccan"
)

user1= User.create!(
  email: "jhon@smith.com",
  password: "1234567",
  username: "Fouad Merkel",
  photo: "https://image.hurimg.com/i/hurriyet/75/0x0/59c9c56b45d2a027e83e2b0b.jpg",
  description: "originally from Morocco, loving food and travel , I am living in Berlin in the last 20 years and I am a foodie, check my reviews there are authentic "

)

nationality_list1= Nationalities_list.create!(
user_id: user1.id

)

restaurant1= Restaurant.create!(
  name: "City Chicken",
  address:"Sonnenallee 59, 12045 Berlin",
  cuisine: "Arab",
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

review1 = Review.create! (
  user_id= user1.id
  restaurant_id= restaurant1.id
  rating: "5",
  service: "5",
  description: "the greatest place in town! such a crazy chicken!",
  photo: 



)
