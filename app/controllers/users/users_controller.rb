class Users::UsersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :destroy]
  before_action :find_user
  
  def index
  end
  
  def show
    @users = User.all
    @universities = University.all
    @articles = Article.where("user_id = ?", @user.id)
    @categories = Category.all
  end

  def destroy
    flash[:notice] = t("user.delete", name: @user.name)
    
    Article.where("user_id = ?", @user.id).each do |article|
      Content.delete_all(article_id: article.id)
      article.destroy
  	end

    @user.destroy
  	redirect_to new_user_session_path
  end

  def get_photo
  	send_data(@user[:photo], :type => @user[:photo_content_type], :disposition => "inline")
  end

  private

  def find_user
    @user = User.find(params[:id]) || return
  end
end
