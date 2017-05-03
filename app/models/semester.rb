class Semester < ApplicationRecord
  has_many :assign_course_to_semesters
  has_many :global_settings
  has_many :registration_informations
end
