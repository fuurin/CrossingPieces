class ChangePhotoInUniversityPhotos < ActiveRecord::Migration
  def change
  	change_column :university_photos, :photo, :binary, limit: 5.megabyte
  end
end
