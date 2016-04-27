class AddZoomToUniversityMap < ActiveRecord::Migration
  def change
    add_column :university_maps, :zoom, :integer, null: false, limit: 2
    change_column :university_maps, :lat, :decimal, null: false, precision: 20
    change_column :university_maps, :lng, :decimal, null: false, precision: 20
  end
end
