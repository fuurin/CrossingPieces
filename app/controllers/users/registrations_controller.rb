class Users::RegistrationsController < Devise::RegistrationsController
	before_action :prepare_photo, only: [:update, :create]
	before_action :get_universities, only: [:edit, :update]

	def prepare_photo
		unless params[:user][:photo].nil?
			params[:user][:photo_content_type] = params[:user][:photo].content_type
			params[:user][:photo] = params[:user][:photo].read
		end
	end

	def get_universities
		@universities = University.all
	end

	def after_update_path_for resource
		after_sign_in_path_for resource
	end
end