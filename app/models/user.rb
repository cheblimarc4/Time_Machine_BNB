class User < ApplicationRecord
  has_one_attached :photo
  # Include default devise modules. Others available are:
 # A user can own many time machines.
 has_many :owned_time_machines, class_name: 'TimeMachine', foreign_key: 'user_id'
 # A user can have many bookings.
 has_many :bookings

 # Through bookings, a user can book many time machines.
 has_many :booked_time_machines, through: :bookings, source: :time_machine

 # Devise modules for authentication.
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
