class RenameUniversitiesInUniversityPhotos < ActiveRecord::Migration
  def change
  	rename_column :university_photos, :universities_id, :university_id
  end
end
