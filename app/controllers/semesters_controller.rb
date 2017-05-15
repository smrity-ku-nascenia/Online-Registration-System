class SemestersController < ApplicationController
  before_action :set_semester, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin
  skip_before_action :verify_authenticity_token

  # GET /semesters
  # GET /semesters.json
  def index
    @semesters = Semester.all
  end

  # GET /semesters/1
  # GET /semesters/1.json
  def show
  end

  # GET /semesters/new
  def new
    @semester = Semester.new
  end

  # GET /semesters/1/edit
  def edit
  end

  # POST /semesters
  # POST /semesters.json
  def create
    @semester = Semester.new(semester_params)

    respond_to do |format|
      if @semester.save
        format.html { redirect_to semesters_path , notice: 'Semester was successfully created.' }
        format.json { render :show, status: :created, location: @semester }
      else
        format.html { render :new }
        format.json { render json: @semester.errors, status: :unprocessable_entity }
      end
    end
  end

  def current_semester
    @semester = Semester.where(:status => "Current")
  end
  def change_current_semester

  end

  def change_semester

    response.headers['X-CSRF-Token'] = form_authenticity_token

    Semester.update_all(:status => '')

    semester = Semester.find(params[:semester])

    if semester.update(:status => "Current")
      render json: {success: 1, msg: 'Current semester has been changed successfully'}
    else
      render json: {success: 0, msg: reg.errors.full_messages.first}
    end
  end



  # PATCH/PUT /semesters/1
  # PATCH/PUT /semesters/1.json
  def update
      respond_to do |format|
        if @semester.update(semester_params)
          format.html { redirect_to @semester, notice: 'Semester was successfully updated.' }
          format.json { render :show, status: :ok, location: @semester }
        else
          format.html { render :edit }
          format.json { render json: @semester.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /semesters/1
  # DELETE /semesters/1.json
  def destroy
    @semester.destroy
    respond_to do |format|
      format.html { redirect_to semesters_url, notice: 'Semester was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_semester
      @semester = Semester.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def semester_params
      params.require(:semester).permit(:semester_id, :semester_name, :max_credit)
    end
end
