class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :en, null: false, unique: true
      t.string :ja, null: false, unique: true
    end
  end
end
