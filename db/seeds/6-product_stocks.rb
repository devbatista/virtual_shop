puts "Creating stocks for products..."

CATEGORIES_WITH_VARIANTS = [
  "Macs",
  "iMac",
  "Iphones"
]

colors = Color.all
storages = Storage.all

Product.find_each do |product|
  if CATEGORIES_WITH_VARIANTS.include?(product.category.master_parent.name)
    colors.each do |color|
      storages.each do |storage|
        ProductStock.create!(
          product: product,
          color: color,
          storage: storage,
          quantity: rand(0..20)
        )
      end
    end
  else
    ProductStock.create!(
      product: product,
      quantity: rand(0..20)
    )
  end
end

puts "Stocks created successfully!"