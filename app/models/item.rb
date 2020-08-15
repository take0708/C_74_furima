class Item < ApplicationRecord
  has_many :item_imgs, dependent: :destroy
  accepts_nested_attributes_for :item_imgs, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shippingarea
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :itemcondition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shippingcost
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shippingday
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shippingmethod
  #has_many :comments, dependent: :destroy
  #has_many :favorites, dependent: :destroy
  #has_many :evaluations
  belongs_to :brand
  belongs_to :category
  #belong_to_active_hash :item_size
  #belong_to :seller, class_name: "user"
  #belong_to :buyer, class_name: "user"
  enum dealing:{shipped:0,transit:1,delivery:2,delivered:3}
  #shipped=発送済み、transit=輸送中、delivery=配達中、delivered=到着済み
  #参考画像:https://www.mercari.com/jp/help_center/article/132/
  #バリデーションは一旦後回し。
  #validates ::shipping_area, presence: true
end
