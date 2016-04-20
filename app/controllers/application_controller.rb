class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
 
  def configure_permitted_parameters
  	permit_params = [:name, :comment, :country_region, :university_id, :photo]
    devise_parameter_sanitizer.for(:sign_up) << permit_params
  end
end
