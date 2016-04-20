class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :comment, :text
    add_column :users, :country_region, :string
    add_column :users, :university_id, :integer
    add_column :users, :photo, :binary
  end
end
