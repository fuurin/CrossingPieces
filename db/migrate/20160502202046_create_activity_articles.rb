class CreateActivityArticles < ActiveRecord::Migration
  def change
    create_table :activity_articles do |t|
      t.references :article, foreign_key: true, null: false
      t.string :period
      t.string :expense
      t.string :place
      t.string :content
      t.string :impression
      t.binary :photo, limit: 5.megabyte
      t.string :photo_content_type
    end
  end
end
