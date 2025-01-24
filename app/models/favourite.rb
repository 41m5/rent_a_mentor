class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :tutor

  validates :rating, inclusion: { in: 0..5, message: "Rating must be between 0 and 5" }
end
