# Clear existing data (optional)
User.destroy_all

user = User.create!(
  name: "John Doe",
  email: "john@example.com",
  password: "password"
)

puts "Created User: #{user.email} with ID: #{user.id}"

tasks = Task.create!([
  { title: "Buy groceries", description: "Milk, eggs, bread", user_id: user.id },
  { title: "Pay bills", description: "Electricity and internet bills", user_id: user.id }
])

puts "Created #{tasks.count} tasks for User ID: #{user.id}"
