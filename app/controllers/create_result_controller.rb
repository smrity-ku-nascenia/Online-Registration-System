class CreateResultController < ApplicationController
  skip_before_action  :verify_authenticity_token, only: :update_mark
  before_action :authorize_admin

  respond_to :html, :js

  def choose_student
    @students = RegistrationInformation.where(:course_id => params[:course_id])
  end

  def show_result
    @enrollments = Enrollment.all.order(:user_id)
  end

  def update_mark
    reg = RegistrationInformation.find(params[:registration_id])
    grde = grade(params[:mark].to_i)
    gpa = gpa(params[:mark].to_i)
    if reg.update(:mark => params[:mark], :grade => grde, :gpa => gpa)
      render json: {success: 1, msg: 'successfully updated marks'}
    else
      render json: {success: 0, msg: reg.errors.full_messages.first}
    end
  end

  def populate_students
    @registrations = RegistrationInformation.where(:course_id => params[:course_id]).order(:enrollment_id)

    respond_to do |format|
       format.js { render 'populate_students', :formats => [:js] }
    end
  end

  def send_email
    @result = RegistrationInformation.where(:enrollment_id => params[:enrollment_id]).order(:course_id)

    if ResultMailer.send_result(@result).deliver
      render json: {success: 1, msg: 'Email sent!'}
    else
      render json: {success: 0, msg: 'Email not sent!'}
    end

  end

  def show_semester_course
    @course_list =  CourseSemester.where(:semester_id => params[:semester_id])

    respond_to do |format|
      format.js { render 'show_semester_course', :formats => [:js] }
    end
  end


  def populate_results

    @result = RegistrationInformation.where(:enrollment_id => params[:enrollment_id]).order(:course_id)

    cgpa = 0.0
    total_credit = 0.0
    @result.each do |result|
      cgpa += result.gpa * result.course.credit
      total_credit += result.course.credit
    end

    cgpa = cgpa/total_credit

    Enrollment.find(params[:enrollment_id]).update(:cgpa => cgpa.round(2), :status => "Passed")

    respond_to do |format|
      format.js { render 'populate_results', :formats => [:js] }
    end
  end

  def grade(mark)
    case mark
      when 80.0..100
        return "A+"
      when 75.0..79.0
        return "A"
      when 70.0..74.0
        return "A-"
      when 65.0..69.0
        return "B+"
      when 60.0..64.0
        return "B+"
      when 55.0..59.0
        return "B"
      when 50.0..54.0
        return "C+"
      when 45.0..49.0
        return "C-"
      when 40.0..44.0
        return "D"
      else
        return "F"
    end
  end

  def gpa(mark)
    case mark
      when 80.0..100
        return 4.00
      when 75.0..79.0
        return 3.75
      when 70.0..74.0
        return 3.50
      when 65.0..69.0
        return 3.25
      when 60.0..64.0
        return 3.00
      when 55.0..59.0
        return 2.75
      when 50.0..54.0
        return 2.50
      when 45.0..49.0
        return 2.25
      when 40.0..44.0
        return 2.00
      else
        return 0.0
    end
  end
end
