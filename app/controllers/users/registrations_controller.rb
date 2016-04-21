class Users::RegistrationsController < Devise::RegistrationsController
 
  def create
  	params[:user][:photo_content_type] = params[:user][:photo].content_type
    params[:user][:photo] = params[:user][:photo].read
    super
  end
 
end