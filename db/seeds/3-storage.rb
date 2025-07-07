puts "Creating storage"

Storage.create!(
  name: "256GB"
)

Storage.create!(
  name: "512GB"
)

Storage.create!(
  name: "1TB"
)

puts "Storages created successfully"