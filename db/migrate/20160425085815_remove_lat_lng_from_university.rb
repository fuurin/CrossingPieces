class RemoveLatLngFromUniversity < ActiveRecord::Migration
  def change
    remove_column :universities, :lat, :decimal
    remove_column :universities, :lng, :decimal
  end
end
