require 'open-uri'

# Clear existing data
User.destroy_all
Outfit.destroy_all
Reservation.destroy_all
Message.destroy_all
ChatRoom.destroy_all

# Create Users
user1 = User.create!(
  first_name: 'John',
  last_name: 'Doe',
  location: 'New York',
  bio: 'Loves fashion and design.',
  rating: 4.5,
  email: 'john@example.com',
  password: 'user_1_password',
  password_confirmation: 'user_1_password'
)

user2 = User.create!(
  first_name: 'Jane',
  last_name: 'Smith',
  location: 'Los Angeles',
  bio: 'Fashion enthusiast.',
  rating: 4.7,
  email: 'jane@example.com',
  password: 'user_2_password',
  password_confirmation: 'user_2_password'
)

# Create Outfits
outfit1 = Outfit.create!(
  name: 'Summer Floral Dress',
  description: 'A beautiful, light and airy dress; perfect for a summer wedding or an evening in Greece. Size small, but fits a medium.',
  location: "London",
  lender_id: user1.id,
  price: 50
)

outfit2 = Outfit.create!(
  name: 'Blue Hydrangea strapped maxi dress',
  description: 'Blue Hydrangea tender tie-strap maxi dress is made of taffeta. Featuring a maxi full skirt, fitted bodice with bow straps, and lace-up closure. The gown is created in a blue floral print.',
  location: "Los Angeles",
  lender_id: user2.id,
  price: 100
)

outfit3 = Outfit.create!(
  name: 'White Mock neck sleeveless low slit dress',
  description: 'Elegant maxi evening sleeveless mermaid dress created from atlas fabric with delicate bodice and high neckline. Features an open back, a sleeveless design, short train and a low thigh slit. The bodice finishes with a delicate seam to underline the waistline.',
  location: "Paris",
  lender_id: user2.id,
  price: 150
)

# Attach photos using ActiveStorage
# outfit1.photo.attach(
#   io: URI.open("https://res.cloudinary.com/de7ixgetx/image/upload/v1717598574/MILLA_117_1024x_ryiqk4_zzag4b.jpg"),
#   filename: 'summer_floral_dress.jpg',
#   content_type: 'image/jpeg'
# )

# outfit2.photo.attach(
#   io: URI.open("https://res.cloudinary.com/de7ixgetx/image/upload/v1717598212/Millanova_137_4f56a10d-721d-4ba5-adeb-dce2e52ac629-314051_bzneup_kkm9mv.jpg"),
#   filename: 'blue_hydrangea_maxi_dress.jpg',
#   content_type: 'image/jpeg'
# )

# outfit3.photo.attach(
#   io: URI.open("https://res.cloudinary.com/de7ixgetx/image/upload/v1717598624/MILLANOVA_1_bbe37b5f-5e4c-4fcd-bce5-a8c06b95b0b0-829457_xp31a1_dv0ka1.jpg"),
#   filename: 'white_neck_sleeves_dress.jpg',
#   content_type: 'image/jpeg'
# )

puts "Creating Reservations..."
# Create Reservations
reservation1 = Reservation.create!(
  outfit: outfit1,
  rating: 5,
  date: Date.today,
  renter_id: user2.id
)

reservation2 = Reservation.create!(
  outfit: outfit2,
  rating: 4,
  date: Date.today,
  renter_id: user1.id
)

chat_room1 = ChatRoom.create!(name: 'Pre-seeded Chat Room')
chat_room2 = ChatRoom.create!(name: 'Another Chat Room')

chat_room1.users << user1
chat_room2.users << user1
chat_room2.users << user2

puts "Seed data created successfully!"
