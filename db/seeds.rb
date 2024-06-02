puts "Cleaning up database..."
Outfit.destroy_all
puts "Database cleaned"

Outfit.create!(
  name: 'Summer Floral Dress',
  description: 'A beautiful, light and airy dress; perfect for a summer wedding or an evening in Greece. Size small, but fits a medium.',
  location: "London",
  lender_id: 1,
  price: 50,
  # photo: "https://itsmilla.com/cdn/shop/files/MILLA_117_1024x.jpg?v=1696266364"
)
