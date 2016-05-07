class ChangeTypeInItem < ActiveRecord::Migration
  def change
  	rename_column :items, :type, :input_type
  end
end
