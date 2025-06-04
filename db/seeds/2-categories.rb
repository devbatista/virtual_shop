puts "Creating categories and subcategories..."

mac = Category.create!(name: "Macs")
Category.create!(name: "Macbook Air", parent: mac)
Category.create!(name: "Macbook Pro", parent: mac)
Category.create!(name: "iMac", parent: mac)
Category.create!(name: "Mac Mini", parent: mac)
Category.create!(name: "Mac Studio", parent: mac)
Category.create!(name: "Mac Pro", parent: mac)
Category.create!(name: "Monitors", parent: mac)

ipads = Category.create!(name: "Ipads")
Category.create!(name: "Ipad Pro", parent: ipads)
Category.create!(name: "Ipad Air", parent: ipads)
Category.create!(name: "Ipad Mini", parent: ipads)

iphones = Category.create!(name: "Iphones")
iphone_16 = Category.create!(name: "Iphone 16", parent: iphones)
Category.create!(name: "Iphone 16e", parent: iphone_16)
Category.create!(name: "Iphone 16 Pro", parent: iphone_16)
Category.create!(name: "Iphone 16 Pro Max", parent: iphone_16)
iphone_15 = Category.create!(name: "Iphone 15", parent: iphones)
Category.create!(name: "Iphone 15", parent: iphone_15)
Category.create!(name: "Iphone 15 Pro", parent: iphone_15)
Category.create!(name: "Iphone 15 Pro Max", parent: iphone_15)
iphone_14 = Category.create!(name: "Iphone 14", parent: iphones)
Category.create!(name: "Iphone 14", parent: iphone_14)
Category.create!(name: "Iphone 14 Pro", parent: iphone_14)
Category.create!(name: "Iphone 14 Pro Max", parent: iphone_14)

watch = Category.create!(name: "Watches")
Category.create!(name: "Series 10", parent: watch)
Category.create!(name: "Ultra 2", parent: watch)
Category.create!(name: "SE", parent: watch)
Category.create!(name: "Nike", parent: watch)

air_pods = Category.create!(name: "AirPods")
Category.create!(name: "Pro", parent: air_pods)
Category.create!(name: "Max", parent: air_pods)

acessories = Category.create!(name: "Acessories")
Category.create!(name: "Mac", parent: acessories)
Category.create!(name: "Ipad", parent: acessories)
Category.create!(name: "Iphone", parent: acessories)
Category.create!(name: "Watch", parent: acessories)
Category.create!(name: "AirPods", parent: acessories)

puts "Categories created successfully"