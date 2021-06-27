class Product < ApplicationRecord
  belongs_to :genre
<<<<<<< HEAD
=======

>>>>>>> 6535c75c29d88ccfcb0e23be37f9834ddbd7bba8
  has_many :cart_items
  has_many :orders, through: :ordered_products
	has_many :ordered_products

  attachment :image
<<<<<<< HEAD
=======
  
  validates :genre_id, presence: true
  validates :name,presence: true
  validates :description,presence: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true }
>>>>>>> 6535c75c29d88ccfcb0e23be37f9834ddbd7bba8

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
