class HomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	if user_signed_in?
  		@user = User.find(current_user.id)
  		@categories = Category.all
  		@articles = Article.where("user_id = ?", @user.id).order("updated_at DESC")
  	end
  end

  def authentication
  end
end
