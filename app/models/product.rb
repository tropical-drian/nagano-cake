class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :orders, through: :ordered_products
	has_many :ordered_products

  attachment :image
end
