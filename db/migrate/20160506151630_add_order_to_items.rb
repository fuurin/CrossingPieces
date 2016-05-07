class AddOrderToItems < ActiveRecord::Migration
  def change
  	add_column :items, :order, :integer, after: :category_id
  	add_column :articles, :created_at, :datetime, null: false, after: :university_id
  	change_column :articles, :updated_at, :datetime, null: false, after: :created_at
  	add_column :articles, :access, :integer, default: 0, after: :updated_at
  	add_column :articles, :short_term_access, :integer, default: 0, after: :access
  	change_column :university_photos, :name, :string, null: false, after: :university_id
  	change_column :users, :university_id, :integer, after: :name
  end
end
