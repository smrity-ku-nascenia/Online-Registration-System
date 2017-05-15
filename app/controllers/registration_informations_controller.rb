class RegistrationInformationsController < ApplicationController
  before_action :set_registration_information, only: [:show, :edit, :update, :destroy]
  before_action :authorize_student

  # GET /registration_informations
  # GET /registration_informations.json
  def index
    @enrollment = Enrollment.where(:user_id => current_user.id, :semester_id => current_semester.id).first
  end

  # GET /registration_informations/1
  # GET /registration_informations/1.json
  def show
  end

  # GET /registration_informations/new
  def new
    @registration_information = RegistrationInformation.new
    @enrollment = Enrollment.where(:user_id => current_user.id, :semester_id => current_semester.id).first
    @courses = CourseSemester.where(:semester_id => current_semester.semester_id)
    # authorize @registration_information
  end


  # GET /registration_informations/1/edit
  def edit
    @registration_information = Enrollment.new
    enrollment = Enrollment.find(params[:enrollment_id])
    @courses = Course.where(:semester_id => enrollment.semester_id)
  end

  # POST /registration_informations
  # POST /registration_informations.json

  def create

    RegistrationInformation.where(:enrollment_id => registration_information_params[:enrollment_id]).delete_all

    registration_information_params[:course_id].each do |course_id|
      reg = RegistrationInformation.new(:enrollment_id => registration_information_params[:enrollment_id], :course_id => course_id, :mark => 0.0, :grade => "", :gpa => 0.0 )

      if !course_id.blank? then
        reg.save
      else
        reg.enrollment.update(:total_credit => registration_information_params[:enrollment_attributes][:total_credit])
      end
    end

    redirect_to '/registration_informations', notice: "Task completed!!"
=begin
    @registration = RegistrationInformation.new(registration_information_params)

    respond_to do |format|
        if @registration.save
          format.html { redirect_to @registration, notice: "course has been successfully registered" }
          format.json { render :show, status: :created, location: @registration }
        else
          format.html { render :new }
          format.json { render json: @registration.errors, status: :unprocessable_entity }
        end
      end
=end
  end

  # PATCH/PUT /registration_informations/1
  # PATCH/PUT /registration_informations/1.json
  def update
    respond_to do |format|
      if @registration_information.update(registration_information_params)
        format.html { redirect_to registration_information_url, notice: "course information was successfully updated." }
        format.json { render :show, status: :ok, location: @registration_information }
      else
        format.html { redirect_to :edit }
        format.json { render json: @registration_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registration_informations/1
  # DELETE /registration_informations/1.json
  def destroy
    @registration_information.destroy
    respond_to do |format|
      format.html { redirect_to registration_informations_url, notice: "Course has been deleted." }
      format.json { head :no_content }
    end
  end



  def see_completed_course
    @enrollment = Enrollment.where(:user_id => current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration_information
      @registration_information = RegistrationInformation.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_information_params
      params.require(:registration_information).permit(:enrollment_id, :mark, :grade, :gpa, :course_id => [], enrollment_attributes: [:total_credit, :id])
    end
end
