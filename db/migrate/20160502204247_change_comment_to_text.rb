class ChangeCommentToText < ActiveRecord::Migration
  def change
  	add_column :lecture_articles, :name, :string
  	change_column :lecture_articles, :homework, :text
  	change_column :lecture_articles, :impression, :text
  	change_column :lecture_articles, :recommended_for, :text
  	add_column :activity_articles, :name, :string
  	change_column :activity_articles, :content, :text
  	change_column :activity_articles, :impression, :text
  	rename_column :shopping_articles, :marchandice, :merchandise
  	change_column :shopping_articles, :merchandise, :text
  	change_column :shopping_articles, :comment, :text
  end
end
