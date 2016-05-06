class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :category, foreign_key: true, null: false
      t.string :name, null: false
      t.string :type, default: "text"
      t.boolean :mandatory, default: true
      t.text :placeholder
    end
  end
end
