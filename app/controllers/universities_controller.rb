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

	def create
		@university = University.new(configure_permitted_parameters)
		@university.save
		redirect_to "/home/index"
	end

	private

		# DBに保存する前には、このようにパラメータをpermitしなければ保存されません。
		def configure_permitted_parameters
			#permit_params = [:name_ja, :name_en,:recommended_point, :comment]
			#devise_parameter_sanitizer.for(:sign_up) << permit_params
			logger.debug("ちゃんかわ")
			logger.debug(params[:university].inspect)
			params.require(:university).permit(:name_ja, :name_en, :recommended_point, :comment, :created_by, :created_at, :updated_by, :updated_at)
		end

		def find_user
			@user = User.find(current_user.id)
		end
end
