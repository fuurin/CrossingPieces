class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name_en, null: false, unique: true
      t.string :name_ja, null: false, unique: true
      t.string :recommended_point, null: false
      t.text :comment, null: false
      t.integer :created_by, null: false
      t.datetime :created_at, null: false
      t.integer :updated_by, null: false
      t.timestamps :updated_at, null: false
      t.binary :photo1, limit: 10.megabyte
      t.string :photo1_content_type
      t.binary :photo2, limit: 10.megabyte
      t.string :photo2_content_type
      t.binary :photo3, limit: 10.megabyte
      t.string :photo3_content_type
    end
  end
end
