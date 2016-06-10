class Users::UsersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :destroy]
  before_action :find_user
  def index
  end

  def destroy
  	@user.destroy
  	redirect_to root_path
  end

  def get_photo
  	send_data(@user[:photo], :type => @user[:photo_content_type], :disposition => "inline")
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
