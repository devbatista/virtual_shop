puts "Creating users"

# create admin user
User.create!(
  name: "Rafael Batista",
  email: "rafael@devbatista.com",
  password: "senha123",
  password_confirmation: "senha_123",
  role: :admin
)

# create customer user
User.create!(
  name: "Robertson Costa",
  email: "robertson@virtualshop.com",
  password: "senha123",
  password_confirmation: "senha123",
  role: :customer
)

puts "Users created successfully"