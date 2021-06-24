class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :orders, through: :ordered_products
	has_many :ordered_products

  attachment :image

  # 検索用メソッド
  def self.search(keyword)
    if keyword =~  /^[0-9]+$/
      @search_products = Product.where("id LIKE?","%#{keyword}%")
    elsif keyword == "true" || keyword == "販売中"
      @search_products = Product.where(status: true)
    elsif keyword == "false" || keyword == "販売停止中"
      @search_products = Product.where(status: false)
    else
      @search_products = Product.where("name like? OR description like?", "%#{keyword}%", "%#{keyword}%")
    end
  end
end
