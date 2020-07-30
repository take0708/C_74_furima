class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true, length: {maximum: 20}
  # ↓正規表現で@とドメインを必須にする(複雑そうなので後回し)
  validates :email, presence: true
  validates :password, presence: true, length: {minimum: 7}
  validates :password_confirmation, presence: true, length: {minimum: 7}
  # ↓正規表現で全角のバリデーションをかける(複雑そうなので後回し)
  validates :family_name, :first_name, presence: true
  # ↓正規表現でカタカナだけのバリデーションをかける(複雑そうなので後回し)
  validates :family_name_kana, :first_name_kana, presence: true
  validates :birth_year, :birth_month, :birth_day, presence: true


  has_one :shipping_info, dependent: :destroy
  # has_many :todo_lists, ependent: :destroy
  # has_one :creditcard, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # has_many :favorites, dependent: :destroy
  # has_many :evaluations, dependent: :destroy
  # has_many :seller_items, foreign_key: “seller_id”, class_name: “items”
  # has_many :buyer_items, foreign_key: “buyer_id”, class_name: “items”
end
