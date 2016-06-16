class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
 
  def configure_permitted_parameters
  	permit_params = [:name, :comment, :country_region, :university_id, :photo, :photo_content_type]
    devise_parameter_sanitizer.for(:sign_up) << permit_params
  end

  def after_sign_out_path_for resource
    new_user_session_path
  end

  def after_sign_in_path_for resource
    home_index_path
  end
end
