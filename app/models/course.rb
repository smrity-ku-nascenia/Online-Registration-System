class Course < ApplicationRecord
  has_many :assign_course_to_semesters
  has_many :registration_informations
end
