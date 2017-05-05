class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, except: :showcourse
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:user_id, :user_name, :picture, :email, :mobile, :type, :password, :password_confirmation)
    end
  end

  def authorize_student
    unless user_signed_in?
      redirect_to new_user_session_path, :notice => "Please log in"
    else
      unless current_user.role == "Student"
        head :none, :notice => "You are not a Student"
      end
    end
  end

  def authorize_admin
    unless user_signed_in?
      redirect_to new_user_session_path, :notice => "Please log in"
    else
      unless current_user.role == "Admin"
        head :none, :notice => "You are not an admin"
      end
    end
  end

  def index
  end
end
