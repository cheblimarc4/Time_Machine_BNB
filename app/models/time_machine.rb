class TimeMachine < ApplicationRecord
  # A time machine belongs to a user (owner).
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  # A time machine can have many bookings.
  has_many :bookings

  # Through bookings, a time machine can be booked by many users.
  has_many :users, through: :bookings

  validates :name, :prize, :comfort, :speed, :size, presence: true
end
