class UniversitiesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :create, :update]
	before_action :set_photos_num, only: [:new, :edit, :create, :update]

	def show
		@categories = Category.all
		@users = User.all
		@universities = University.all
		@university = University.find(params[:id]) || return
		@photosNum = get_photo_num @university.id
		@articles = Article.where("university_id = ?", @university.id).order("id DESC")
	end

	def new
		@university = University.new
	end

	def edit
	end

	def create
		@university = University.new(university_params)
		@invalid_photos = invalid_photos
		if @university.valid? and @invalid_photos.empty?
			@university.save
			UniversityPhoto.import photos(@university.id)
			flash[:notice] = {subject: @university.name_ja, action: t("university.add")}
			redirect_to home_index_path
		else render 'new' end
	end

	def update
	end

	def destroy # Destroy all pictures at the same time
	end

	def get_photo_num id
		UniversityPhoto.where("university_id = ?", id).length
	end

	def get_photo
		p = UniversityPhoto.where("university_id = ?", params[:id])[params[:num].to_i]
		send_data(p[:photo], :type => p[:content_type], :disposition => "inline")
  end

	private

	def set_photos_num
		@photos_num = 3
	end

	def university_params
		params[:university].merge!(creater_params) if params[:action] == "create"
		params[:university].merge!(updater_params).merge!(map_params)
		params[:university].permit :name_en, :name_ja, :recommended_point, :comment,
			:created_by, :created_at, :updated_by, :updated_at, :lat, :lng, :zoom
	end

	def creater_params
		{created_by: current_user.id, created_at: Time.zone.now}
	end

	def updater_params
		{updated_by: current_user.id, updated_at: Time.zone.now}
	end

	def map_params
		p = params[:university]
		lat = p[:lat] =~ /^[+-]?\d+\.?\d+$/ ? p[:lat].to_f : nil
		lng = p[:lng] =~ /^[+-]?\d+\.?\d+$/ ? p[:lng].to_f : nil
		zoom = p[:zoom] =~ /^\d+$/ ? p[:zoom].to_i : nil
		{lat: lat, lng: lng, zoom: zoom}
	end


	def photo_params photo, id
		{ name: photo.original_filename, content_type: photo.content_type,
			photo: id.nil? ? nil : photo.read, university_id: id }
	end

	def photos id
		p = params[:university][:photos]
		return [] if p.nil?
		p.map{ |key, photo| UniversityPhoto.new(photo_params(photo, id)) }
	end

	def invalid_photos
		photos(nil).select{|photo| photo.valid? == false}
	end
end
