class Booking < ApplicationRecord
  belongs_to :tutor
  belongs_to :user

  validates :day, presence: true
  validates :time, presence: true
end
