class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true, null: false
      t.references :university, foreign_key: true, null: false
      t.string :title, null: false
      t.string :category, null: false
      t.datetime :updated_at, null: false
    end
  end
end
