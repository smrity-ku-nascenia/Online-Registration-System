class RegistrationInformation < ApplicationRecord
  belongs_to :user, :class_name => "User", :foreign_key => "student_id"
  belongs_to :course
  belongs_to :semester

  validates :mark, :numericality => {:greater_than_or_equal_to => 0.0}
end
