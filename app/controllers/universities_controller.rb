class UniversitiesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_user

	def show
	end

	def new
		@university = University.new
	end

	def edit
	end

	def create
		@university = University.new(university_params)
		return render('new') unless @university.save
		info = {name: @university.name_ja, photos_warning: save_photos(@university.id),
			map_warning: save_map(@university.id)}
		redirect_to home_index_path(university_created_info: info)
	end

	def update
	end

	def destroy
		# Destroy all at the same time
	end

 	private

 	# For University
 	def university_params
 		register_creater params[:university]
 		register_updater params[:university]
  	params[:university].permit :name_en, :name_ja, :recommended_point, :comment,
  		:created_by, :created_at, :updated_by, :updated_at
  end

 	def register_creater university_params
 		university_params[:created_by] = current_user.id
 		university_params[:created_at] = Time.zone.now
 	end

 	def register_updater university_params
 		university_params[:updated_by] = current_user.id
 		university_params[:updated_at] = Time.zone.now
 	end



 	# For UniversityPhoto
  def photos_params
  	params[:university].require(:photos).permit!
  end

  def make_photo photo, id
  	{ :name => photo.original_filename, :photo => photo.read,
  		:content_type => photo.content_type, :university_id => id } if photo.present?
  end

  def save_photos id
  	return [] if params[:university][:photos].nil?
  	photos = photos_params.map {|k, p| UniversityPhoto.new(make_photo(p, id))}
  	UniversityPhoto.import(photos).failed_instances.map{|p| p[:name]}
	end



	# For UniversityMap
	def map_params
		map = params[:map]
		map[:lat] = map[:lat].to_f if map[:lat] =~ /^[+-]?\d+\.?\d+$/
		map[:lng] = map[:lng].to_f if map[:lng] =~ /^[+-]?\d+\.?\d+$/
		map[:zoom] = map[:zoom].to_i if map[:zoom] =~ /^\d+$/
  	map.permit :lat, :lng, :zoom
  end

  def make_map map, id
  	{ :lat => map[:lat], :lng => map[:lng],
  		:zoom => map[:zoom], :university_id => id}
  end

	def save_map id
		return [] if params[:map][:lat].nil? or params[:map][:lng].nil?
		university_map = UniversityMap.new make_map(map_params, id)
		return [] if university_map.save
		university_map.errors.messages.map{|key, message| message}.flatten
	end



  def find_user
    @user = User.find(current_user.id)
  end
end
