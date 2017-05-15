class Semester < ApplicationRecord
  has_many :course_semesters
  has_many :enrollments
end
