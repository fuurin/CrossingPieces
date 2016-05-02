class CreateShoppingArticles < ActiveRecord::Migration
  def change
    create_table :shopping_articles do |t|
      t.references :article, foreign_key: true, null: false
      t.string :name
      t.string :marchandice
      t.string :comment
      t.binary :photo, limit: 5.megabyte
      t.string :photo_content_type
    end
  end
end
