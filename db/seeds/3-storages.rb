puts "Creating storage"

Storage.create!(
  value: "256GB"
)

Storage.create!(
  value: "512GB"
)

Storage.create!(
  value: "1TB"
)

puts "Storages created successfully"