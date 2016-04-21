class Users::RegistrationsController < Devise::RegistrationsController
 
  def create
  	if params[:user][:photo]
	  	params[:user][:photo_content_type] = params[:user][:photo].content_type
	    params[:user][:photo] = params[:user][:photo].read
	  end
    super
  end
 
end