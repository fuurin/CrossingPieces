class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.references :article, index: true, foreign_key: true, null: false
      t.references :item, index: true, foreign_key: true, null: false
      t.text :content
    end
  end
end
