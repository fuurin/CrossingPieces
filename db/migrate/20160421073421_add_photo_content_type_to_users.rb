class AddPhotoContentTypeToUsers < ActiveRecord::Migration
  def change
  	change_column_null :users, :name, false, 0
  	change_column_null :users, :comment, false, 0
  	change_column_null :users, :country_region, false, 0
  	change_column :users, :photo, :binary, limit: 10.megabyte
    add_column :users, :photo_content_type, :string
  end
end
