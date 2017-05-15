class RegistrationInformation < ApplicationRecord
  include ActionController::Helpers

  belongs_to :course
  belongs_to :enrollment

  validates :mark, :numericality => {:greater_than_or_equal_to => 0.0}

  accepts_nested_attributes_for :enrollment, allow_destroy: true


  def checked(enrollment_id,course_id)
    reg = RegistrationInformation.where(:enrollment_id => enrollment_id, :course_id => course_id)

    !reg.blank?
  end


  helper_method :checked

end
