class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :time_machine
end
