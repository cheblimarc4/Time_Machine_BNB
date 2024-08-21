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

  time_sphere = alice.owned_time_machines.create!(
    name: 'Time Sphere',
    size: 2,
    comfort: 'Medium',
    speed: 120,
    price: 60000
  )

  chrono_traveler = bob.owned_time_machines.create!(
    name: 'Chrono Traveler',
    size: 4,
    comfort: 'Very High',
    speed: 180,
    price: 110000
  )

  time_skimmer = eve.owned_time_machines.create!(
    name: 'Time Skimmer',
    size: 1,
    comfort: 'Low',
    speed: 80,
    price: 30000
  )

  quantum_wheel = john.owned_time_machines.create!(
    name: 'Quantum Wheel',
    size: 3,
    comfort: 'High',
    speed: 160,
    price: 95000
  )

  time_slider = alice.owned_time_machines.create!(
    name: 'Time Slider',
    size: 2,
    comfort: 'Moderate',
    speed: 140,
    price: 70000
  )

  chronos_blade = bob.owned_time_machines.create!(
    name: 'Chronos Blade',
    size: 2,
    comfort: 'High',
    speed: 170,
    price: 85000
  )

  temporal_ship = eve.owned_time_machines.create!(
    name: 'Temporal Ship',
    size: 4,
    comfort: 'Very High',
    speed: 190,
    price: 115000
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

  Booking.create!(
    user: alice,
    time_machine: chrono_traveler,
    start_date: Date.today + 5.days,
    end_date: Date.today + 10.days
  )

  Booking.create!(
    user: bob,
    time_machine: time_sphere,
    start_date: Date.today + 8.days,
    end_date: Date.today + 13.days
  )

  Booking.create!(
    user: eve,
    time_machine: time_skimmer,
    start_date: Date.today + 2.days,
    end_date: Date.today + 6.days
  )

  Booking.create!(
    user: john,
    time_machine: time_slider,
    start_date: Date.today + 14.days,
    end_date: Date.today + 19.days
  )

  Booking.create!(
    user: alice,
    time_machine: quantum_wheel,
    start_date: Date.today + 3.days,
    end_date: Date.today + 8.days
  )

  Booking.create!(
    user: bob,
    time_machine: chronos_blade,
    start_date: Date.today + 16.days,
    end_date: Date.today + 21.days
  )

  Booking.create!(
    user: eve,
    time_machine: temporal_ship,
    start_date: Date.today + 25.days,
    end_date: Date.today + 30.days
  )

  puts "Bookings created."

  puts "Seeding completed successfully."
