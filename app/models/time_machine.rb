class TimeMachine < ApplicationRecord
  has_one_attached :photo
  # A time machine belongs to a user (owner).
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  # A time machine can have many bookings.
  has_many :bookings

  # Through bookings, a time machine can be booked by many users.
  has_many :users, through: :bookings
end
