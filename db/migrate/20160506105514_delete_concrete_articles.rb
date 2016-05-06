class DeleteConcreteArticles < ActiveRecord::Migration
  def change
  	drop_table :lecture_articles
  	drop_table :activity_articles
  	drop_table :shopping_articles
  end
end
