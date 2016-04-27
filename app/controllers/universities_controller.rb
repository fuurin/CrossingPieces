class UniversitiesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_user

	def new
	end

	def create
		university = University.new(university_params)
		register_creater university and register_updater university
		if university.save && save_photos(university.id) && save_map(university.id)
			redirect_to home_index_path
		else render 'new' end
	end

	def edit
	end

	def destroy
	end

 	private

 	def register_creater university
 		university.created_by = current_user.id
 		university.created_at = Time.zone.now
 	end

 	def register_updater university
 		university.updated_by = current_user.id
 		university.updated_at = Time.zone.now
 	end

 	def university_params
  	params[:university].permit :name_ja, :name_en, :recommended_point, :comment
  end

  def photos_params
  	params[:university].require(:photos).permit!
  end

  def map_params
  	params[:university_map].permit :lat, :lng, :zoom
  end

  def make_photo photo, id
  	{:university_id => id, :photo => photo.read, :content_type => photo.content_type}
  end

  def make_map map, id
  	{:university_id => id, :lat => map[:lat].to_f, :lng => map[:lng].to_f, :zoom => map[:zoom].to_i}
  end

  def save_photos id
  	photos = photos_params
  	if photos.empty? then return end
  	UniversityPhoto.import photos.map{|key, p| UniversityPhoto.new(make_photo(p, id))}
	end

	def save_map id
		map = map_params
		if map[:lat].empty? or map[:lng].empty? then return end
		UniversityMap.new(make_map(map, id)).save
	end

  def find_user
    @user = User.find(current_user.id)
  end
end
