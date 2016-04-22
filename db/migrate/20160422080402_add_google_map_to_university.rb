class AddGoogleMapToUniversity < ActiveRecord::Migration
  def change
    add_column :universities, :lat, :decimal
    add_column :universities, :lng, :decimal
    add_column :universities, :zoom, :integer
  end
end
