class CreateUniversityMaps < ActiveRecord::Migration
  def change
    create_table :university_maps do |t|
      t.references :university, foreign_key: true, null: false
      t.decimal :lat, null: false
      t.decimal :lng, null: false
    end
  end
end
