# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'open-uri'

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

alice = User.create!(
  email: 'alice@example.com',
  password: 'password',
  first_name: 'Alice',
  last_name: 'Wonder'
)

bob = User.create!(
  email: 'bob@example.com',
  password: 'password',
  first_name: 'Bob',
  last_name: 'Builder'
)

eve = User.create!(
  email: 'eve@example.com',
  password: 'password',
  first_name: 'Eve',
  last_name: 'Adams'
)

puts "Users created."

# Create Time Machines
puts "Creating Time Machines..."
time_machines_data = [
  {
    name: 'Delorean',
    size: 2,
    comfort: 'Luxury',
    speed: '100 years/sec',
    price: 50000,
    time_period: 'Future',
    time_year: '2030',
    destination: 'Los Angeles, CA',
    user: john,
    image: "DALLE1.jpg"
  },
  {
    name: 'TARDIS',
    size: 3,
    comfort: 'First Class',
    speed: '50 years/sec',
    price: 100000,
    time_period: 'Past',
    time_year: '1895',
    destination: 'London, UK',
    user: jane,
    image: "DALLE2.jpg"
  },
  {
    name: 'Flux Capacitor',
    size: 1,
    comfort: 'Standard',
    speed: '100 years/sec',
    price: 75000,
    time_period: 'Unknown',
    time_year: '???',
    destination: 'New York, NY',
    user: john,
    image: "DALLE3.jpg"
  },
  {
    name: 'Time Sphere',
    size: 2,
    comfort: 'Standard',
    speed: '50 years/sec',
    price: 60000,
    time_period: 'Ancient Egypt',
    time_year: '2500 BC',
    destination: 'Cairo, Egypt',
    user: alice,
    image: "DALLE4.jpg"
  },
  {
    name: 'Chrono Traveler',
    size: 4,
    comfort: 'First Class',
    speed: '10 years/sec',
    price: 110000,
    time_period: 'Distant Future',
    time_year: '3050',
    destination: 'Tokyo, Japan',
    user: bob,
    image: "DALLE5.jpg"
  },
  {
    name: 'Time Skimmer',
    size: 1,
    comfort: 'Basic',
    speed: '1 year/sec',
    price: 30000,
    time_period: 'Prehistoric Era',
    time_year: '100 million BC',
    destination: 'Rio de Janeiro, Brazil',
    user: eve,
    image: "DALLE6.jpg"
  },
  {
    name: 'Quantum Wheel',
    size: 3,
    comfort: 'Luxury',
    speed: '100 years/sec',
    price: 95000,
    time_period: 'Quantum State',
    time_year: '???',
    destination: 'San Francisco, CA',
    user: john,
    image: "DALLE7.jpg"
  },
  {
    name: 'Time Slider',
    size: 2,
    comfort: 'Standard',
    speed: '50 years/sec',
    price: 70000,
    time_period: 'Parallel Universe',
    time_year: '2024',
    destination: 'Paris, France',
    user: alice,
    image: "DALLE8.jpg"
  },
  {
    name: 'Chronos Blade',
    size: 2,
    comfort: 'Luxury',
    speed: '50 years/sec',
    price: 85000,
    time_period: 'Medieval Europe',
    time_year: '1350',
    destination: 'Rome, Italy',
    user: bob,
    image: "DALLE9.jpg"
  },
  {
    name: 'Temporal Ship',
    size: 4,
    comfort: 'First Class',
    speed: '10 years/sec',
    price: 115000,
    time_period: 'Post-Apocalyptic Earth',
    time_year: '2150',
    destination: 'Berlin, Germany',
    user: eve,
    image: "DALLE10.jpg"
  }
]

time_machines_data.each do |data|
  machine = data[:user].owned_time_machines.create!(
    name: data[:name],
    size: data[:size],
    comfort: data[:comfort],
    speed: data[:speed],
    price: data[:price],
    time_period: data[:time_period],
    time_year: data[:time_year],
    destination: data[:destination]
  )

  machine.photo.attach(
    io: File.open(Rails.root.join("app/assets/images/#{data[:image]}")),
    filename: data[:image],
  )
  machine.save
end

puts "Time Machines created."

# Create Bookings
puts "Creating Bookings..."
Booking.create!(
  user: john,
  time_machine: TimeMachine.find_by(name: 'TARDIS'),
  start_date: Date.today,
  end_date: Date.today + 7.days
)

Booking.create!(
  user: jane,
  time_machine: TimeMachine.find_by(name: 'Delorean'),
  start_date: Date.today + 10.days,
  end_date: Date.today + 15.days
)

Booking.create!(
  user: jane,
  time_machine: TimeMachine.find_by(name: 'Flux Capacitor'),
  start_date: Date.today + 20.days,
  end_date: Date.today + 25.days
)

Booking.create!(
  user: alice,
  time_machine: TimeMachine.find_by(name: 'Chrono Traveler'),
  start_date: Date.today + 5.days,
  end_date: Date.today + 10.days
)

Booking.create!(
  user: bob,
  time_machine: TimeMachine.find_by(name: 'Time Sphere'),
  start_date: Date.today + 8.days,
  end_date: Date.today + 13.days
)

Booking.create!(
  user: eve,
  time_machine: TimeMachine.find_by(name: 'Time Skimmer'),
  start_date: Date.today + 2.days,
  end_date: Date.today + 6.days
)

Booking.create!(
  user: john,
  time_machine: TimeMachine.find_by(name: 'Time Slider'),
  start_date: Date.today + 14.days,
  end_date: Date.today + 19.days
)

Booking.create!(
  user: alice,
  time_machine: TimeMachine.find_by(name: 'Quantum Wheel'),
  start_date: Date.today + 3.days,
  end_date: Date.today + 8.days
)

Booking.create!(
  user: bob,
  time_machine: TimeMachine.find_by(name: 'Chronos Blade'),
  start_date: Date.today + 16.days,
  end_date: Date.today + 21.days
)

Booking.create!(
  user: eve,
  time_machine: TimeMachine.find_by(name: 'Temporal Ship'),
  start_date: Date.today + 25.days,
  end_date: Date.today + 30.days
)

puts "Bookings created."

puts "Seeding completed successfully."
