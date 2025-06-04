puts "Creating orders..."

# Find users
admin = User.find_by(email: "rafael@devbatista.com")
customer = User.find_by(email: "robertson@virtualshop.com")

# Find products
iphone = Product.find_by(name: "iPhone 16")
ipad = Product.find_by(name: "iPad Pro 13” M4")
watch = Product.find_by(name: "Apple Watch Series 10")
macbook = Product.find_by(name: "MacBook Air M3")
airpods = Product.find_by(name: "AirPods Pro (2nd generation)")
case_iphone = Product.find_by(name: "Case for iPhone")

# Order 1: customer, completed
order1 = Order.create!(
  user: customer,
  total: iphone.price + ipad.price,
  status: "completed"
)
OrderItem.create!(order: order1, product: iphone, quantity: 1, price: iphone.price)
OrderItem.create!(order: order1, product: ipad, quantity: 1, price: ipad.price)

# Order 2: admin, pending
order2 = Order.create!(
  user: admin,
  total: watch.price * 2,
  status: "pending"
)
OrderItem.create!(order: order2, product: watch, quantity: 2, price: watch.price)

# Order 3: customer, processing
order3 = Order.create!(
  user: customer,
  total: macbook.price + airpods.price,
  status: "processing"
)
OrderItem.create!(order: order3, product: macbook, quantity: 1, price: macbook.price)
OrderItem.create!(order: order3, product: airpods, quantity: 1, price: airpods.price)

# Order 4: admin, cancelled
order4 = Order.create!(
  user: admin,
  total: case_iphone.price,
  status: "cancelled"
)
OrderItem.create!(order: order4, product: case_iphone, quantity: 3, price: case_iphone.price)

puts "Orders created successfully"