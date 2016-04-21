class HomeController < ApplicationController
	before_action :authenticate_user!, only: :authentication
  def index
  	if user_signed_in?
  		@user = User.find(current_user.id)
  	end
  end

  def authentication
  end
end
