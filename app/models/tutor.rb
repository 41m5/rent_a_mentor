class Tutor < ApplicationRecord
  belongs_to :user
  has_many :tutor_subjects
  has_many :subjects, through: :tutor_subjects

  has_many :bookings, dependent: :destroy

  validates :first_name, :last_name, :email, :price, :qualification, :key_stage, presence: true

end
