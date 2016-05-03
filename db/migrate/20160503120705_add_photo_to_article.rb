class AddPhotoToArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :photo, :binary, limit: 5.megabyte
  	add_column :articles, :photo_content_type, :string
  	remove_column :lecture_articles, :photo
  	remove_column :lecture_articles, :photo_content_type
  	remove_column :activity_articles, :photo
  	remove_column :activity_articles, :photo_content_type
  	remove_column :shopping_articles, :photo
  	remove_column :shopping_articles, :photo_content_type
  end
end
