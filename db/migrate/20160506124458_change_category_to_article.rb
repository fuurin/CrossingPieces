class ChangeCategoryToArticle < ActiveRecord::Migration
  def change
  	remove_column :articles, :category
  	add_column :articles, :category_id, :integer, after: :user_id, null: false
  end
end
