class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :item_explanation, null: false
      t.integer :price, null: false
      t.integer :dealing,default: 0, null: false, limit: 1
      t.integer :shipping_area, default: 0, null: false, limit: 1
      #t.references :brand, null: false, foreign_key: true
      #t.references :category, null: false, foreign_key: true
      t.references :item_condition, null: false, foreign_key: true
      #t.references :shipping_method, null: false, foreign_key: true
      #t.references :shipping_cost, null: false, foreign_key: true
      #t.references :shipping_day, null: false, foreign_key: true
      #t.references :item_size, null: false, foreign_key: true
      #t.references :seller, null: false, foreign_key: true
      #t.references :buyer, null: false, foreign_key: true
      t.timestamps
    end
  end
end