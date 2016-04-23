class UniversitiesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_user

	def new
		@university = University.new
	end

	# def create
	# 	写真の登録前には、このようにコンテントタイプを保存し、readメソッドを通す必要があります。
 	# 	if params[:university][:photo1]
	#   	params[:university][:photo1_content_type] = params[:university][:photo1].content_type
	#     params[:university][:photo1] = params[:university][:photo1].read
	#   end
 	# end

 	private

 	# DBに保存する前には、このようにパラメータをpermitしなければ保存されません。
 	# def configure_permitted_parameters
  # 	permit_params = [:name, :comment, :country_region, :university_id, :photo, :photo_content_type]
  #   devise_parameter_sanitizer.for(:sign_up) << permit_params
  # end

  def find_user
    @user = User.find(current_user.id)
  end
end
