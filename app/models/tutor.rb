class Tutor < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :users, through: :bookings
  # has_one_attached :photo
  has_many :subjects, through: :tutor_subjects
end
