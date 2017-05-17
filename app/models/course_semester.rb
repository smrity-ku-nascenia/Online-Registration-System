class CourseSemester < ApplicationRecord
  belongs_to :semester
  belongs_to :course
  has_many :course_semesters
end
