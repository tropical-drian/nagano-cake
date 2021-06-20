class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :orders, through: :ordered_products
	has_many :ordered_products

  attachment :image

  # 検索用メソッド
  def self.search(keyword)
  where(["name like? OR description like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
