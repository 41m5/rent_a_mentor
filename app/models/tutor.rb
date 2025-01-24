class Tutor < ApplicationRecord
  belongs_to :user

  has_many :tutor_subjects
  has_many :subjects, through: :tutor_subjects
  has_many :favourites
  has_many :favourite_by, through: :favourites, source: :user
  has_many :bookings, dependent: :destroy

  validates :first_name, :last_name, :email, :price, :qualification, :cannot_book_self, :key_stage, presence: true

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def average_rating
    return 0 if favourites.count.zero?
    (favourites.sum(:rating).to_f / favourites.count).round(1)
  end

  private

#   def cannot_book_self
#     if user == booking.user
#       errors.add(:base, "You cannot book a lesson with yourself")
#     end
#   end
end
