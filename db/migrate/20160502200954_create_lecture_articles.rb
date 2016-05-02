class CreateLectureArticles < ActiveRecord::Migration
  def change
    create_table :lecture_articles do |t|
      t.references :article, foreign_key: true, null: false
      t.string :credit
      t.string :department
      t.string :period
      t.string :homework
      t.string :impression
      t.string :recommended_for
      t.binary :photo, limit: 5.megabyte
      t.string :photo_content_type
    end
  end
end
