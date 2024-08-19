class TimeMachine < ApplicationRecord
  belongs_to :user
  belongs_to :user, through: :booking
end
