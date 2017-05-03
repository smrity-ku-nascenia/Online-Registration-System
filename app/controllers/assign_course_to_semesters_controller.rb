class AssignCourseToSemestersController < ApplicationController
  before_action :set_assign_course_to_semester, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin

  # GET /assign_course_to_semesters
  # GET /assign_course_to_semesters.json
  def index
    @assign_course_to_semesters = AssignCourseToSemester.all

    @semester = Semester.all
    @courses = Course.all
  end

  # GET /assign_course_to_semesters/1
  # GET /assign_course_to_semesters/1.json
  def show
  end

  # GET /assign_course_to_semesters/new
  def new
    @assign_course_to_semester = AssignCourseToSemester.new
  end

  # GET /assign_course_to_semesters/1/edit
  def edit
  end

  # POST /assign_course_to_semesters
  # POST /assign_course_to_semesters.json
  def create
    @assign_course_to_semester = AssignCourseToSemester.new(assign_course_to_semester_params)

    respond_to do |format|
      if @assign_course_to_semester.save
        format.html { redirect_to @assign_course_to_semester, notice: 'Assign course to semester was successfully created.' }
        format.json { render :show, status: :created, location: @assign_course_to_semester }
      else
        format.html { render :new }
        format.json { render json: @assign_course_to_semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assign_course_to_semesters/1
  # PATCH/PUT /assign_course_to_semesters/1.json
  def update
    respond_to do |format|
      if @assign_course_to_semester.update(assign_course_to_semester_params)
        format.html { redirect_to @assign_course_to_semester, notice: 'Assign course to semester was successfully updated.' }
        format.json { render :show, status: :ok, location: @assign_course_to_semester }
      else
        format.html { render :edit }
        format.json { render json: @assign_course_to_semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assign_course_to_semesters/1
  # DELETE /assign_course_to_semesters/1.json
  def destroy
    @assign_course_to_semester.destroy
    respond_to do |format|
      format.html { redirect_to assign_course_to_semesters_url, notice: 'Assign course to semester was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assign_course_to_semester
      @assign_course_to_semester = AssignCourseToSemester.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assign_course_to_semester_params
      params.require(:assign_course_to_semester).permit(:semester_id, :course_id)
    end
end
