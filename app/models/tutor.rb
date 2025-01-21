class Tutor < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_many :bookings, dependent: :destroy

  has_many :tutor_subjects
  has_many :subjects, through: :tutor_subjects

  has_many :bookings
  has_many :users, through: :bookings
end
