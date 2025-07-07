puts "Creating products..."

# Macs
Product.create!(
  name: "MacBook Air M3",
  description: "Apple MacBook Air with M3 chip",
  price: 12000,
  stock: 10,
  category: Category.find_by(name: "Macbook Air"),
  storage: Storage.order('RANDOM()').first,
  color: Color.order('RANDOM()').first
)

Product.create!(
  name: "MacBook Pro M3 Pro",
  description: "Apple MacBook Pro with M3 Pro chip",
  price: 18000,
  stock: 8,
  category: Category.find_by(name: "Macbook Pro"),
  storage: Storage.order('RANDOM()').first,
  color: Color.order('RANDOM()').first
)

Product.create!(
  name: "iMac 24”",
  description: "Apple iMac 24 inches",
  price: 15000,
  stock: 5,
  category: Category.find_by(name: "iMac"),
  storage: Storage.order('RANDOM()').first,
  color: Color.order('RANDOM()').first
)

# iPads
Product.create!(
  name: "iPad Pro 13” M4",
  description: "New iPad Pro with M4 chip",
  price: 11000,
  stock: 12,
  category: Category.find_by(name: "Ipad Pro"),
  storage: Storage.order('RANDOM()').first,
  color: Color.order('RANDOM()').first
)

Product.create!(
  name: "iPad Air 11”",
  description: "iPad Air 11 inches",
  price: 7000,
  stock: 15,
  category: Category.find_by(name: "Ipad Air"),
  storage: Storage.order('RANDOM()').first,
  color: Color.order('RANDOM()').first
)

# iPhones
Product.create!(
  name: "iPhone 16",
  description: "Apple iPhone 16",
  price: 9000,
  stock: 20,
  category: Category.find_by(name: "Iphone 16"),
  storage: Storage.order('RANDOM()').first,
  color: Color.order('RANDOM()').first
)

Product.create!(
  name: "iPhone 16 Pro",
  description: "Apple iPhone 16 Pro",
  price: 11000,
  stock: 10,
  category: Category.find_by(name: "Iphone 16 Pro"),
  storage: Storage.order('RANDOM()').first,
  color: Color.order('RANDOM()').first
)

Product.create!(
  name: "iPhone 15",
  description: "Apple iPhone 15",
  price: 7500,
  stock: 18,
  category: Category.find_by(name: "Iphone 15"),
  storage: Storage.order('RANDOM()').first,
  color: Color.order('RANDOM()').first
)

# Watches
Product.create!(
  name: "Apple Watch Series 10",
  description: "Apple Watch Series 10",
  price: 5000,
  stock: 25,
  category: Category.find_by(name: "Series 10")
)

Product.create!(
  name: "Apple Watch Ultra 2",
  description: "Apple Watch Ultra 2",
  price: 8000,
  stock: 7,
  category: Category.find_by(name: "Ultra 2")
)

# AirPods
Product.create!(
  name: "AirPods Pro (2nd generation)",
  description: "Apple AirPods Pro second generation",
  price: 2500,
  stock: 30,
  category: Category.find_by(name: "Pro")
)

Product.create!(
  name: "AirPods Max",
  description: "Apple AirPods Max",
  price: 4500,
  stock: 12,
  category: Category.find_by(name: "Max")
)

# Accessories
Product.create!(
  name: "Case for MacBook",
  description: "Protective case for MacBook",
  price: 300,
  stock: 50,
  category: Category.find_by(name: "Mac")
)

Product.create!(
  name: "Case for iPhone",
  description: "Protective case for iPhone",
  price: 200,
  stock: 60,
  category: Category.find_by(name: "Iphone")
)

puts "Products created successfully"