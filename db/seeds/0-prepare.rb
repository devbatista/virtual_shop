puts "Clearing old data..."

User.delete_all
Storage.delete_all
Color.delete_all
OrderItem.delete_all
Order.delete_all
Product.delete_all
Category.delete_all

puts "Clean environment"