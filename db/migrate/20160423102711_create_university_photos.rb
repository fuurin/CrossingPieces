class CreateUniversityPhotos < ActiveRecord::Migration
  def change
    create_table :university_photos do |t|
      t.references :universities, null: false
      t.binary :photo, null: false
      t.string :content_type, null: false
    end
  end
end
