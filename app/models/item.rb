class Item < ApplicationRecord
  enum dealing:{shipped:0,transit:1,delivery:2,delivered:3}
  #shipped=発送済み、transit=輸送中、delivery=配達中、delivered=到着済み
  #参考画像:https://www.mercari.com/jp/help_center/article/132/
  has_many :item_imgs, dependent: :destoroy
  has_many :comments, dependent: :destoroy
  has_many :favorites, dependent: :destoroy
  has_many :evaluations
  belong_to :brands
  belong_to :category
  belong_to_active_hash :item_condition
  belong_to_active_hash :shipping_method
  belong_to_active_hash :shipping_cost
  belong_to_active_hash :shipping_day
  belong_to_active_hash :item_size
  belong_to :seller, class_name: "user"
  belong_to :buyer, class_name: "user"
end
