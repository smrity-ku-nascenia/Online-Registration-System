class Course < ApplicationRecord
  has_many :course_semesters
  has_many :registration_informations
end
