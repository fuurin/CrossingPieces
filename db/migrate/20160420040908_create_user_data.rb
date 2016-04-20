class CreateUserData < ActiveRecord::Migration
  def change
    create_table :user_data do |t|
      t.string :name null:false
      t.text :comment null: false
      t.string :country_region null: false
      t.integer :university_id null: false
      t.binary :photo
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
