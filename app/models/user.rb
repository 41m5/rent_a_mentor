class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :tutors
  has_many :favourites
  has_many :tutors, through: :favourites
  has_many :favourite_tutors, through: :favourites, source: :tutor

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
