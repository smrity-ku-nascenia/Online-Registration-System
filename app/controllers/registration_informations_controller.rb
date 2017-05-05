class RegistrationInformationsController < ApplicationController
  before_action :set_registration_information, only: [:show, :edit, :update, :destroy]
  before_action :authorize_student

  # GET /registration_informations
  # GET /registration_informations.json
  def index
    @course_takens = RegistrationInformation.where(student_id: current_user.id)
  end

  # GET /registration_informations/1
  # GET /registration_informations/1.json
  def show
  end

  def see_my_result

    student = current_user.id

    @result = RegistrationInformation.where(:student_id => student, :semester_id => GlobalSetting.first.semester_id)

    unless @result.empty?
      render partial: 'result', locals: { results: @result }
    end
  end

  # GET /registration_informations/new
  def new
    @registration_information = RegistrationInformation.new

    begin
      @course_list =  AssignCourseToSemester.where(:semester_id => Semester.find(1))
    rescue
      @course_list = AssignCourseToSemester.all
    end

  end

  def showcourse
    @course_list =  AssignCourseToSemester.where(:semester_id => params[:semester_id])

    respond_to do |format|
      format.js { render 'showcourse', :formats => [:js] }
    end
  end

  # GET /registration_informations/1/edit
  def edit
  end

  # POST /registration_informations
  # POST /registration_informations.json
  def create
    @registration = RegistrationInformation.new(registration_information_params)

    @check = RegistrationInformation.where(:student_id => @registration.student_id, :semester_id => @registration.semester_id, :course_id => @registration.course_id)

    if @check.empty? then

      respond_to do |format|
        if @registration.save
          format.html { redirect_to @registration, notice: "course has been successfully registered" }
          format.json { render :show, status: :created, location: @registration }
        else
          format.html { render :new }
          format.json { render json: @registration.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to @registration, notice: "Course Already Exists"
    end
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

  def populate_completed_courses

    @result = RegistrationInformation.where(:student_id => current_user.id, semester_id: params[:semester_id] ).order(:student_id)

    unless @result.empty?
      respond_to do |format|
        format.js { render 'populate_results', :formats => [:js] }
      end
    else
      render json: {success: 0, msg: 'You are not registered to this Semester!'}
    end


  end

  def see_completed_course

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration_information
      @registration_information = RegistrationInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_information_params
      params.require(:registration_information).permit(:student_id, :semester_id, :course_id, :mark, :grade, :gpa, :cgpa)
    end
end
