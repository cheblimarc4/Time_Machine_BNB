class Booking < ApplicationRecord
   # A booking belongs to a user.
   belongs_to :user

   # A booking belongs to a time machine.
   belongs_to :time_machine
end
