puts "Creating users"

# create admin user
User.create!(
  name: "Rafael Batista",
  email: "rafael@devbatista.com",
  password: "senha123",
  password_confirmation: "senha123",
  phone: '+55 11 98681-9042',
  role: :admin
)

# create customer user
User.create!(
  name: "Robertson Costa",
  email: "robertson@virtualshop.com",
  password: "senha123",
  password_confirmation: "senha123",
  phone: '+55 11 99130-8008',
  role: :customer
)

puts "Users created successfully"