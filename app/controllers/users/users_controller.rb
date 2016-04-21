class Users::UsersController < ApplicationController
	before_action :authenticate_user!, only: :authentication
  def index
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to root_path
  end

  def get_photo
  	@user = User.find(current_user.id)
  	send_data(@user[:photo], :type => @user[:photo_content_type], :disposition => "inline")
  end
end
