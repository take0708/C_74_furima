class CreateItemImgs < ActiveRecord::Migration[5.2]
  def change
    create_table :item_imgs do |t|
      t.string :image, null:false
      #外部キー制約でマイグレートできない為、references型から一時的にintegerとします。
      t.integer :item_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
