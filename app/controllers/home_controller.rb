class HomeController < ApplicationController
	before_action :authenticate_user!, only: :authentication
  def index
  	@number = 3
  end

  def authentication
  end
end
