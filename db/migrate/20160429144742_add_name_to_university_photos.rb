class AddNameToUniversityPhotos < ActiveRecord::Migration
  def change
  	add_column :university_photos, :name, :string
  	change_column :university_maps, :lat, :decimal, null: false, precision: 20, scale: 17
    change_column :university_maps, :lng, :decimal, null: false, precision: 20, scale: 17
  end
end
