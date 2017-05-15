class Enrollment < ApplicationRecord
  validates :semester_id, presence: true
  belongs_to :user
  belongs_to :semester
  has_many :registration_informations
end
