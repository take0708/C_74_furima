class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      #t.text :item_explanation, null: false
      t.integer :price, null: false
      t.integer :dealing,default: 0, null: false, limit: 1
      #t.integer :shipping_area, null: false
      #以下、本来は全てreferences型ですが、外部キー制約でマイグレートできない為、一時的にintegerとします。
      #t.integer :brand_id, null: false, foreign_key: true
      #t.integer :category_id, null: false, foreign_key: true
      #t.integer :item_condition_id, null: false, foreign_key: true
      #t.integer :shipping_method_id, null: false, foreign_key: true
      #t.integer :shipping_cost_id, null: false, foreign_key: true
      #t.integer :shipping_day_id, null: false, foreign_key: true
      #t.integer :item_size_id, null: false, foreign_key: true
      #t.integer :seller_id, null: false, foreign_key: true
      #t.integer :buyer_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end