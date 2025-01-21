class Subject < ApplicationRecord
  has_many :tutors
  has_many :tutors, through: :tutor_subjects
end
