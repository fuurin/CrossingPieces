class UniversitiesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_user

	def new
		@university = University.new
	end

	def create
		@university = University.new(university_param_permit)
		register_creater
		register_updater
		if @university.save
			save_photos @university.id, params[:university][:photos]
			redirect_to home_index_path
		else render 'new' end
	end

	def edit
	end

	def destroy
	end

 	private

 	def register_creater
 		@university.created_by = current_user.id
 		@university.created_at = Time.zone.now
 	end

 	def register_updater
 		@university.updated_by = current_user.id
 		@university.updated_at = Time.zone.now
 	end

 	def university_param_permit
  	params[:university].permit(:name_ja, :name_en, :recommended_point, :comment, :photos)
  end

  def save_photos(university_id, photos)
  	photos.each do |key, p|
			photo = UniversityPhoto.new(:university_id => university_id)
		  photo[:content_type] = p.content_type
		  photo[:photo] = p.read
		  photo.save
		end
	end

  def find_user
    @user = User.find(current_user.id)
  end
end
