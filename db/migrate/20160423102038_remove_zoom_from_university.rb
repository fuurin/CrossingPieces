class RemoveZoomFromUniversity < ActiveRecord::Migration
  def change
  	remove_column :universities, :zoom
  end
end
