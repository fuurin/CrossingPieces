class HomeController < ApplicationController
	before_action :authenticate_user!, only: :authentication
  def index
  	if user_signed_in?
  		@user = User.find(current_user.id)
  	end
  end

  def authentication
  end

  def get_image
  	@user = User.find(current_user.id)
  	send_data(@user.photo, :disposition => "inline", :type => "image/png")
  end
end
