class ShippingInfo < ApplicationRecord
  belongs_to :user, optional: true

  validates :family_name, :first_name, :postcode, :prefecture, :city, :house_number, presence: true
  # ↓正規表現でカタカナだけのバリデーションをかける(複雑そうなので後回し)
  validates :family_name_kana, :first_name_kana,  presence: true
end
