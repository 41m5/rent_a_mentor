class Booking < ApplicationRecord
  belongs_to :tutor
  belongs_to :user
end
