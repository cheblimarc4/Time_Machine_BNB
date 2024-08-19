# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
  # Clear existing data
Booking.destroy_all
TimeMachine.destroy_all
User.destroy_all

# Create Users
puts "Creating Users..."
john = User.create!(
  email: 'john@example.com',
  password: 'password',
  first_name: 'John',
  last_name: 'Doe'
)

jane = User.create!(
  email: 'jane@example.com',
  password: 'password',
  first_name: 'Jane',
  last_name: 'Doe'
)

puts "Users created."

# Create Time Machines
puts "Creating Time Machines..."
delorean = john.owned_time_machines.create!(
  name: 'Delorean',
  size: 2,
  comfort: 'High',
  speed: 100,
  price: 50000
)

tardis = jane.owned_time_machines.create!(
  name: 'TARDIS',
  size: 3,
  comfort: 'Very High',
  speed: 150,
  price: 100000
)

flux_capacitor = john.owned_time_machines.create!(
  name: 'Flux Capacitor',
  size: 1,
  comfort: 'Moderate',
  speed: 200,
  price: 75000
)

puts "Time Machines created."

# Create Bookings
puts "Creating Bookings..."
Booking.create!(
  user: john,
  time_machine: tardis,
  start_date: Date.today,
  end_date: Date.today + 7.days
)

Booking.create!(
  user: jane,
  time_machine: delorean,
  start_date: Date.today + 10.days,
  end_date: Date.today + 15.days
)

Booking.create!(
  user: jane,
  time_machine: flux_capacitor,
  start_date: Date.today + 20.days,
  end_date: Date.today + 25.days
)

puts "Bookings created."

puts "Seeding completed successfully."
