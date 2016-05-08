class ArticlesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_article, only: [:show, :edit, :update, :destroy]
	before_action :find_university, only: [:new]
	before_action :ready_to_post, only: [:new, :create]

	def show
	end

	def new
		@article = Article.new
		@active_category_id = @categories[0].id
	end

	def edit
	end

	def create
		@article = Article.new(article_params)
		if @article.save and invalid_contents.empty?
			Content.import contents
			flash[:notice] = {subject: @article.title, action: t("article.post")}
			redirect_to home_index_path
		else
			@active_category_id = params[:article][:category_id].to_i
			flash[:error] = invalid_contents
			render 'new'
		end
	end

	def update
		respond_to do |format|
			if @article.update(article_params)
				format.html { redirect_to @article, notice: 'Article was successfully updated.' }
				format.json { render :show, status: :ok, location: @article }
			else
				format.html { render :edit }
				format.json { render json: @article.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@article.destroy
		respond_to do |format|
			format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		def set_article
			@article = Article.find(params[:id])
		end

		def find_university
			return @user_university = nil if current_user.university_id.nil?
			@user_university = University.find(current_user.university_id).name_en
		end

		def ready_to_post
			@universities = University.order(:name_en)
			@categories = Category.order(:id)
			@items = Item.order(:category_id, :order)
		end

		def article_params
			params[:article][:user_id] = current_user.id
			photo_params
			time_params
			params.require(:article).permit :user_id, :category_id, :university_id, 
				:created_at, :updated_at, :title, :photo, :photo_content_type
		end

		def photo_params
			return if params[:article][:photo].nil?
			params[:article][:photo_content_type] = params[:article][:photo].content_type
			params[:article][:photo] = params[:article][:photo].read
		end

		def time_params
			params[:article][:created_at] = Time.zone.now if params["action"] == "create"
			params[:article][:updated_at] = Time.zone.now
		end

		def contents
			params[:item].map do |i, c|
				Content.new({article_id: @article.id, item_id: i, content: c})
			end
		end

		def invalid_contents
			invalid = params[:item].select do |id, content|
				item = Item.find(id)
				Item.name if item.mandatory and content.empty?
			end
			Hash[invalid.map {|k, v| [Item.find(k).name, v]}]
		end
end
