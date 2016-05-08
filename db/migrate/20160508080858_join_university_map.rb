class JoinUniversityMap < ActiveRecord::Migration
  def change
  	add_column :universities, :lat, :decimal, null: false, precision: 20, scale: 17
    add_column :universities, :lng, :decimal, null: false, precision: 20, scale: 17
    add_column :universities, :zoom, :integer, null: false, limit: 2
    drop_table :university_maps
    add_column :articles, :photo_name, :string, after: :photo
    change_column :university_photos, :name, :string, after: :photo, null: false
  end
end
