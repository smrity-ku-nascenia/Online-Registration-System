class CourseSemester < ApplicationRecord
  belongs_to :semester
  belongs_to :course
end
