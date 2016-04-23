class RemovePhotosFromUniversity < ActiveRecord::Migration
	def change
		remove_column :universities, :photo1
		remove_column :universities, :photo1_content_type
		remove_column :universities, :photo2
		remove_column :universities, :photo2_content_type
		remove_column :universities, :photo3
		remove_column :universities, :photo3_content_type
	end
end
