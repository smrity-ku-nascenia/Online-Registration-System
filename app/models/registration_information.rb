class RegistrationInformation < ApplicationRecord
  include ActionController::Helpers

  belongs_to :course_semester
  belongs_to :enrollment

  validates :mark, :numericality => {:greater_than_or_equal_to => 0.0}

  accepts_nested_attributes_for :enrollment, :course_semester, allow_destroy: true


  def checked(enrollment_id,course_semester_id)
    reg = RegistrationInformation.where(:enrollment_id => enrollment_id, :course_semester_id => course_semester_id)

    !reg.blank?
  end


  helper_method :checked

end
