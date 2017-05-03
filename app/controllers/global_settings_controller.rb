class GlobalSettingsController < ApplicationController
  before_action :set_global_setting, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin

  # GET /global_settings
  # GET /global_settings.json
  def index
    @global_settings = GlobalSetting.all
  end

  # GET /global_settings/1
  # GET /global_settings/1.json
  def show
  end

  # GET /global_settings/new
  def new
    @global_setting = GlobalSetting.new
  end

  # GET /global_settings/1/edit
  def edit
  end

  # POST /global_settings
  # POST /global_settings.json
  def create
    @global_setting = GlobalSetting.all

    unless @global_setting.nil? then
      GlobalSetting.delete_all
    end

    @global_setting = GlobalSetting.new(global_setting_params)

    respond_to do |format|
      if @global_setting.save
        format.html { redirect_to @global_setting, notice: 'Global setting was successfully created.' }
        format.json { render :show, status: :created, location: @global_setting }
      else
        format.html { render :new }
        format.json { render json: @global_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /global_settings/1
  # PATCH/PUT /global_settings/1.json
  def update
    respond_to do |format|
      if @global_setting.update(global_setting_params)
        format.html { redirect_to @global_setting, notice: 'Global setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @global_setting }
      else
        format.html { render :edit }
        format.json { render json: @global_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /global_settings/1
  # DELETE /global_settings/1.json
  def destroy
    @global_setting.destroy
    respond_to do |format|
      format.html { redirect_to global_settings_url, notice: 'Global setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_global_setting
      @global_setting = GlobalSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def global_setting_params
      params.require(:global_setting).permit(:semester_id)
    end
end
