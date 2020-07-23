class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_imgs do |t|
      t.string :src
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
